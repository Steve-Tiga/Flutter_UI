import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class AspectRatioLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ElementTitleView('宽高比的组件-AspectRatio'),
              Container(
                height: 150,
                width: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Container(
                    color: Colors.red,
                    child: Text('宽：高=3/1'),
                    alignment: Alignment.center,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
