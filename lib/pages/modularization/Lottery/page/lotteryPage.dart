import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/pages/modularization/Lottery/view/spinning_wheel_widget.dart';
import 'package:flutterstudy/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/modularization/Lottery/model/lottery_model.dart';
import 'package:flutterstudy/widgets/load_image.dart';

class LotteryPage extends StatefulWidget {
  const LotteryPage({Key key}) : super(key: key);

  @override
  _LotteryPageState createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  final ScrollController scrollController = ScrollController();

  // ignore: close_sinks
  final StreamController<double> topBarOpacityStream =
      StreamController(); //监听滑动刷新导航栏

  List<Luck> _items = [
    Luck("现金红包", 0),
    Luck("优惠券", 1),
    Luck("谢谢参与", 2),
    Luck("现金红包", 0),
    Luck("优惠券", 1),
    Luck("谢谢参与", 2),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    double topBarOpacity = 0.0;
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          topBarOpacity = 1.0;
          topBarOpacityStream.add(topBarOpacity);
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          topBarOpacity = scrollController.offset / 24;
          topBarOpacityStream.add(topBarOpacity);
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          topBarOpacity = 0.0;
          topBarOpacityStream.add(topBarOpacity);
        }
      }
    });

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 2.0 * pi)
        .chain(CurveTween(curve: Curves.linear))
        .animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
    topBarOpacityStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            child: LoadAssetImage(
              'lottery/bg_lottery_beijing',
              fit: BoxFit.fill,
            ),
          ),
          _buildLotteryWheel(),
          _buildAppBar(),
        ],
      ),
    );
  }

  //抽奖转盘
  Widget _buildLotteryWheel() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              _wheelBG(),
              Center(
                child: LoadAssetImage('lottery/bg_zhuanpan_up_di',
                    width: MediaQuery.of(context).size.width * 318 / 375),
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget child) {
                  return Transform.rotate(angle: animation.value, child: child);
                },
                child: SpinningWheelWidget(
                  items: _items,
                ),
              ),
              Center(
                child: Container(
                  width: 118,
                  height: 170,
                  child:  LoadAssetImage('lottery/lottery_anniu'),
                ),
              ),
              _buildGo(),
            ],
          ),
        ],
      ),
    );
  }

  //导航栏
  Widget _buildAppBar() {
    return Column(
      children: <Widget>[
        StreamBuilder(
            stream: topBarOpacityStream.stream,
            initialData: 0.0,
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              return Container(
                // height: MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(115, 67, 241, snapshot.data),
                        Color.fromRGBO(82, 169, 255, snapshot.data),
                      ]),
                  // color: Colors.white.withOpacity(topBarOpacity),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                })),
                        Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '团长红包抽奖活动',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

  //轮盘背景
  Widget _wheelBG() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).padding.top + 12, 0, 0),
        child: Stack(
          children: [
            LoadAssetImage('lottery/bg_zhuanpan_down'),
            Positioned(
                bottom: 13,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CupertinoButton(
                    child: RichText(
                      text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                            text: '您现有 ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: '很多',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text: ' 次抽奖机会',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ]),
                    ),
                    // color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
          ],
        ));
  }

  //抽奖按钮
  Widget _buildGo() {
    return Material(
      color: Colors.white.withAlpha(0),
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
        ),
        onTap: _animation,
      ),
    );
  }

  void _animation() {
    if (!animationController.isAnimating) {
      //请求抽奖结果
      animationController.reset();
      setState(() {
        animationController.duration = Duration(milliseconds: 500);
        animation =
            Tween(begin: 0.0, end: 2.0 * pi).animate(animationController);
      });
      //想要获取的角度
      double angle = 0;
      animationController.repeat();
      getLotteryResult()
          .then((result) {
            angle = result / 6;
            animationController.reset();
            animationController.duration = Duration(seconds: 2);
            animation = Tween(begin: 0.0, end: (2.0 + angle) * pi * 2)
                .chain(CurveTween(curve: Curves.decelerate))
                .animate(animationController);
            animationController.forward(from: 0.0).then((_) {
              setState(() {});
            }).whenComplete(() => {});
          })
          .whenComplete(() => {})
          .catchError((Object error) {
            animationController.stop();
            print('请求异常');
          });
    }
  }
}

//模仿获取后台返回的抽奖结果(调整返回的数字即可控制抽奖结果)
Future<int> getLotteryResult() async {
  await Future.delayed(Duration(seconds: 3), () {});
  return 2;
}
