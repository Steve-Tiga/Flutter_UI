import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/modularization/Lottery/model/lottery_model.dart';
import 'package:flutterstudy/widgets/load_image.dart';

class SpinningWheelWidget extends StatefulWidget {
  final List<Luck> items;
  const SpinningWheelWidget({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpinningWheelWidgetState();
  }
}

class _SpinningWheelWidgetState extends State<SpinningWheelWidget> {
  Size get size => Size(MediaQuery.of(context).size.width * 284 / 375,
      MediaQuery.of(context).size.width * 284 / 375);

  double _rotate(int index) => (index / widget.items.length) * 2 * pi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            // color: Colors.yellow,
            // decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)]),
            child: LoadAssetImage('lottery/bg_zhuanpan_up',width: size.width,height: size.height,fit: BoxFit.cover,),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (var luck in widget.items) ...[_buildCard(luck)],
              for (var luck in widget.items) ...[_buildText(luck)],
            ],
          ),
        ],
      ),
    );
  }

  //绘制扇形
  _buildCard(Luck luck) {
    var rotate = _rotate(widget.items.indexOf(luck));
    var _angle = 2 * pi / widget.items.length;
    return Transform.rotate(
      angle: rotate,
      child: ClipPath(
        clipper: _LuckPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
        ),
      ),
    );
  }

  //绘制文字内容
  _buildText(Luck luck) {
    var rotate = _rotate(widget.items.indexOf(luck));
    return Transform.rotate(
      angle: rotate,
      child: Container(
          height: size.height / 5 * 4,
          width: size.width / 5 * 4,
          // color: Colors.yellow,
          alignment: Alignment.topCenter,
          child: Container(
            child: _textContainer(luck),
          )),
    );
  }

  //文字内容定义
  _textContainer(Luck luck) {
    switch (luck.type) {
    //现金红包
      case 0:
        {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(luck.text,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                        // borderRadius: BorderRadius.circular(2),
                        color: Colors.red,
                      ),

                      child: Text(
                        '最高',
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(2),
                    child: RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <InlineSpan>[
                            TextSpan(
                                text: '￥',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                              text: '1888',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ))
              ],
            ),
          );
        }
      case 1:
        {
          return Container(
            child: Column(
              children: [
                Text(luck.text,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w500)),
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <InlineSpan>[
                        TextSpan(
                            text: '￥',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: '1~',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text: '￥',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: '1888',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                )
              ],
            ),
          );
        }
      case 2:
        {
          return Container(
            width: 40,
            child: Text(luck.text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 16)),
          );
        }
    }
  }
}

//绘制扇形
class _LuckPath extends CustomClipper<Path> {
  final double angle;

  _LuckPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(_LuckPath oldClipper) {
    return angle != oldClipper.angle;
  }
}