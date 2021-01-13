import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class ChackboxPage extends StatefulWidget {
  @override
  _ChackboxPageState createState() => _ChackboxPageState();
}

class _ChackboxPageState extends State<ChackboxPage> {
  var _radioGroupValue = '语文';
  var _checkValue1 = false;
  var _checkValue2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选和复选'),
      ),
      body: Container(
        child: Column(
          children: [
            ElementTitleView('单选'),
            Row(
              children: <Widget>[
                Flexible(
                  child: RadioListTile(
                    title: Text('语文'),
                    value: '语文',
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value;
                      });
                    },
                  ),
                ),
                Flexible(
                    child: RadioListTile(
                      title: Text('数学'),
                      value: '数学',
                      groupValue: _radioGroupValue,
                      onChanged: (value) {
                        setState(() {
                          _radioGroupValue = value;
                        });
                      },
                    )),
                Flexible(
                    child: RadioListTile(
                      title: Text('英语'),
                      value: '英语',
                      groupValue: _radioGroupValue,
                      onChanged: (value) {
                        setState(() {
                          _radioGroupValue = value;
                        });
                      },
                    )),
              ],
            ),
            ElementTitleView('复选'),
            CheckboxListTile(
              title: Text('Hello'),
              subtitle: Text('点击试试'),
              secondary: Icon(Icons.person),
              value: _checkValue1,
              onChanged: (value){
                setState(() {
                  _checkValue1 = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Hello'),
              subtitle: Text('点击试试'),
              value: _checkValue2,
              onChanged: (value){
                setState(() {
                  _checkValue2 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

