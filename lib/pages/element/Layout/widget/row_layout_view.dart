import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class RowLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElementTitleView("水平布局-Row"),
            Text('默认'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('mainAxisAlignment: MainAxisAlignment.center'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('mainAxisAlignment: MainAxisAlignment.end'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('mainAxisAlignment: MainAxisAlignment.spaceBetween'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('mainAxisAlignment: MainAxisAlignment.spaceAround'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('mainAxisAlignment: MainAxisAlignment.spaceEvenly'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('crossAxisAlignment: CrossAxisAlignment.start'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('crossAxisAlignment: CrossAxisAlignment.center'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('crossAxisAlignment: CrossAxisAlignment.end'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
