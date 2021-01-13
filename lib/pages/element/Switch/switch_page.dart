import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开关-Switch'),
      ),
      body: Center(
        child: Column(
            children: [
            ElementTitleView('Switch使用'),
        Switch(
          value: _switchValue,
          //选择状态的颜色
          activeColor: Colors.deepPurple,
          activeTrackColor: Colors.deepOrangeAccent,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        ElementTitleView('SwitchListTile'),
        SwitchListTile(
          title: Text('是否允许4G下载'),
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        ElementTitleView('ios风格'),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        )
        ],
      ),
    ),);
  }
}
