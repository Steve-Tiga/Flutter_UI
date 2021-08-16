import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({Key key}) : super(key: key);

  @override
  _LottieAnimationPageState createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              //动画从 controller.forward() 正向执行 结束时会回调此方法
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              //动画从 controller.reverse() 反向执行 结束时会回调此方法
              _animationController.forward();
            } else if (status == AnimationStatus.forward) {

            } else if (status == AnimationStatus.reverse) {

            }
          });
    _animation = Tween(begin: 0.99, end: .86).animate(_animationController);
    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Lottie动画'),
      ),
      body: Stack(
        children: [
          LottieBuilder.network('https://assets9.lottiefiles.com/packages/lf20_haZBfQ.json'),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Ink(
                height: 60,
                width: 200,
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Center(
                    child: Text(
                      '放烟花',
                      style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
