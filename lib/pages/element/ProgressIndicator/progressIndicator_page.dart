import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class ProgressIndicatorPage extends StatefulWidget {
  @override
  _ProgressIndicatorPageState createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度组件'),
      ),
      body: Container(
        child: Column(
            children: [
            ElementTitleView('水平进度指示器'),
        Container(
          padding: EdgeInsets.all(12),
          child: LinearProgressIndicator(
//                value: 0.3,//value的值范围是0-1
            backgroundColor: Colors.purple,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        ElementTitleView('圆形进度指示器'),
        Container(
          height: 120,
          width: 120,
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(
//                value: 0.3,
            backgroundColor: Colors.greenAccent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        ElementTitleView('ios风格的指示器'),
        Container(
          padding: EdgeInsets.all(12),
          child: CupertinoActivityIndicator(
            radius: 40,
          ),)
          ],
        ),
      ),
    );
  }
}
