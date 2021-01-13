import 'package:flutter/material.dart';
import '../../widgets/element_title_view.dart';
class StackLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElementTitleView("叠加布局-Stack"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width:100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child:Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 100,
                    top: 10,
                    height: 80,
                    width: 80,
                    child: Container(
                      color: Colors.green,
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
