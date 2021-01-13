import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterstudy/res/resources.dart';

class ProviderDemoPage extends StatefulWidget {
  @override
  _ProviderDemoPageState createState() => _ProviderDemoPageState();
}

class _ProviderDemoPageState extends State<ProviderDemoPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return MainProvide();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Number(),
              MyButton()
            ],
          ),
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvide provider=Provider.of<MainProvide>(context);
    int curNum=provider.curNum;
    return Container(
        margin: EdgeInsets.only(top:200),
        child: Column(
          children: <Widget>[
            Text('$curNum',style: Theme.of(context).textTheme.headline2),
            Text('点击按钮+1',style: Theme.of(context).textTheme.headline6),
          ],
        )
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvide provider=Provider.of<MainProvide>(context);
    return Container(
      child: FlatButton(
        color: HSLColors.app_main,
        textColor: Colors.white,
        minWidth: 200,
        height: 50,
        onPressed: () => provider.add(),
        child: Text('点击:${provider.curNum}'),
      ),
    );
  }
}

class MainProvide extends ChangeNotifier{
  int curNum=0;
  add(){
    curNum+=1;
    notifyListeners();
  }
}
