import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class FractionallySizedBoxLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 12),child: Container(
      color: Colors.white,
      child: Column(
        children: [
          ElementTitleView('相对父组件尺寸-FractionallySizedBox'),
          Container(
            height: 150,
            width: 150,
            color: Colors.blue,
            child: FractionallySizedBox(
              widthFactor: .8,
              heightFactor: .5,
              alignment: Alignment(0.5, 0.9),
              child: Container(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
