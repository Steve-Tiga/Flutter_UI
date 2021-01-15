import 'package:flutter/material.dart';
import 'package:flutterstudy/util/colors.dart';
class ElementTitleView extends StatelessWidget {
  final String title;

  const ElementTitleView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: HSLColors.line))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle, //可以设置角度，BoxShape.circle直接圆形
                color: HSLColors.caribbean_color),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
