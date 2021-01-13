import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/Text/widget/richText_view.dart';
import 'package:flutterstudy/res/colors.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  List<Widget> textViewList = <Widget>[];//布局组件
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListViews();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HSLColors.bg_color,
      appBar: AppBar(
        title: Text('文本'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
        return textViewList[index];
      },itemCount: textViewList.length,),
    );
  }

  addListViews(){
    textViewList.add(RichTextPage());
  }
}

