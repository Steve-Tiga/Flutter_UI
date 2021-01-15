import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';
import 'dart:math';

class SystemAnimationWidgets extends StatefulWidget {
  @override
  _SystemAnimationWidgetsState createState() => _SystemAnimationWidgetsState();
}

class _SystemAnimationWidgetsState extends State<SystemAnimationWidgets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElementTitleView('AnimatedBuilder'),
          AnimatedBuilderWidget(),
          ElementTitleView('AlignTransition--控件位置变换动画'),
          AlignTransitionWidget(),
          ElementTitleView('DecoratedBoxTransition--外观装饰属性动画'),
          DecoratedBoxTransitionWidget(),

          //隐式动画，无需进行生命周期管理
          ElementTitleView('AnimatedContainer-带动画功能的Container'),
          AnimatedContainerWidget(),
          ElementTitleView('AnimatedAlign--构建位置动画'),
          AnimatedAlignWidget(),
        ],
      ),
    );
  }
}


class DecoratedBoxTransitionWidget extends StatefulWidget {
  @override
  _DecoratedBoxTransitionWidgetState createState() => _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState extends State<DecoratedBoxTransitionWidget>with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _animationController.reset();
            _animationController.forward();
          }
        });

    _animation = DecorationTween(begin: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15)
    ), end: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(55)
    ))
        .animate(_animationController);

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: _animation,
      child: Container(
        height: 100,
        width: 100,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}



class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool click = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            click = !click;
          });
        },
        child: AnimatedContainer(
          height: click ? 150 : 100,
          width: click ? 150 : 100,
          color: Colors.blue,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}


///AnimatedBuilderWidget
class AnimatedBuilderWidget extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
    AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
      });
    animation = Tween(begin: 0.0, end: 2.0 * pi).animate(animationController);
    //开始动画
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
          child: FlutterLogo(
            size: 60,
          ),
        ),
        Text('AnimatedBuilder')
      ],
    );
  }
}

class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  var _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.lightBlue,
      child: AnimatedAlign(
        alignment: _alignment,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,//设置动画速度
        child: IconButton(
          icon: Icon(
            Icons.print,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _alignment = Alignment.bottomRight;
            });
          },
        ),
      ),
    );
  }
}

class AlignTransitionWidget extends StatefulWidget {
  @override
  _AlignTransitionWidgetState createState() => _AlignTransitionWidgetState();
}

class _AlignTransitionWidgetState extends State<AlignTransitionWidget> with TickerProviderStateMixin{
  Animation _animation;
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _animationController.reset();
            _animationController.forward();
          }
        });
    _animation = Tween<AlignmentGeometry>(
        begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(_animationController);

    //开始动画
    _animationController.forward();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.blue,
      child:AlignTransition(
        alignment: _animation,
        child: Container(
          height: 30,
          width: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}

