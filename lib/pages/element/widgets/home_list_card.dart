import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterstudy/util/colors.dart';
import 'package:flutterstudy/util/utils.dart';
import 'package:flutterstudy/widgets/load_image.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard(
      {Key key,
      this.title,
      this.subTitle,
      this.bgImagePath,
      this.subImagePath,
      this.color,
      this.shadowColor})
      : super(key: key);

  final String title;
  final String subTitle;
  final String bgImagePath;
  final String subImagePath;
  final Color color;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;
    Color _shadowColor;
    final bool isDark = context.isDark;
    if (color == null) {
      _backgroundColor = isDark ? Colors.black : Colors.white;
    } else {
      _backgroundColor = color;
    }

    if (shadowColor == null) {
      _shadowColor = isDark ? Colors.transparent : const Color(0x80DCE7FA);
    } else {
      _shadowColor = isDark ? Colors.transparent : shadowColor;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: _shadowColor,
              offset: const Offset(1.0, 2.0),
              blurRadius: 2,
              spreadRadius: 0.5),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          LoadAssetImage(
            bgImagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <InlineSpan>[
                            TextSpan(
                                text: title.substring(0, 1),
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            TextSpan(text: '  '),
                            TextSpan(
                                text: title.substring(1, title.length),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ])),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadAssetImage(
                      subImagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                flex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
