import 'package:flutter/material.dart';
import '../../widgets/element_title_view.dart';

class ColumnLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElementTitleView("垂直布局-Column"),
            Text('crossAxisAlignment: CrossAxisAlignment.start'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 140,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('crossAxisAlignment: CrossAxisAlignment.center'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 140,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text('crossAxisAlignment: CrossAxisAlignment.end'),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.green,
                  ),
                  Container(
                    height: 30,
                    width: 140,
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
