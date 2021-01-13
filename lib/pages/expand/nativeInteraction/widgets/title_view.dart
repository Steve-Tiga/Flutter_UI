import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  const TitleView(
      {Key key,
        this.titleTxt: "",
        this.subTxt
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24,top: 12,bottom: 12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
