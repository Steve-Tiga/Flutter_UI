import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class FlexibleExpandedLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 12),child: Container(
      color: Colors.white,
      child: Column(
        children: [
          ElementTitleView('权重组件'),
          Text('Flexible'),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 50,
                width: 100,
              ),
              Flexible(
                  child: Container(
                    color: Colors.red,
                    height: 50,

                  )
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 45,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 45,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 45,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 50,
                width: 100,
              ),
              Expanded(
                child: OutlineButton(
                  child: Text('OutlineButton'),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 100,
              ),
            ],
          )
        ],
      ),
    ),);
  }
}
