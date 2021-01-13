import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'widgets/title_view.dart';

class NativeInteractionPage extends StatefulWidget {
  @override
  _NativeInteractionPageState createState() => _NativeInteractionPageState();
}

class _NativeInteractionPageState extends State<NativeInteractionPage> {
  List<Widget> listViews = <Widget>[];
  var channel = MethodChannel('ThreeView_MethodChannel');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: missing_return
    channel.setMethodCallHandler((call) {
      print("原生->flutter${call.arguments}");
      showToast("原生->flutter${call.arguments}");
    });
    addListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('原生交互'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return listViews[index];
        },
        itemCount: listViews.length,
      ),
    );
  }

  void addListData() {
    //通道数组
    var platforms = <MethodChannel>[];
    if (defaultTargetPlatform == TargetPlatform.android) {
      listViews.add(
        TitleView(
          titleTxt: '嵌入Android View',
        ),
      );
      listViews.add(Container(
        color: Colors.pinkAccent,
        child: AndroidView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          //原生组件注册名称
          creationParams: {'text': 'Flutter传给AndroidTextView的参数'},
          //传入了一个map参数，并由原生组件接收
          creationParamsCodec: const StandardMessageCodec(), //传入的是一个编码对象这是固定写法
        ),
        height: 80,
      ));
    } else {
      listViews.add(
        TitleView(
          titleTxt: '嵌入iOS View',
        ),
      );
      listViews.add(Container(
        color: Colors.pinkAccent,
        child: UiKitView(
          viewType: 'FristView',
          creationParams: {'text': 'Flutter传给ios的参数'},
          onPlatformViewCreated: (viewId) {
            platforms
                .add(MethodChannel('com.flutter.guide.MyFlutterView_$viewId'));
          },
          creationParamsCodec: StandardMessageCodec(),
        ),
        height: 80,
      ));
      listViews.add(
        TitleView(
          titleTxt: 'ios MethodChannel通讯 Flutter->Native',
        ),
      );
      listViews.add(Container(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              height: 80,
              child: UiKitView(
                viewType: 'SecendView',
                creationParams: {'text': 'Flutter通过事件传参数给原生View'},
                onPlatformViewCreated: (viewId) {
                  platforms.add(MethodChannel('SecendView_$viewId'));
                },
                creationParamsCodec: StandardMessageCodec(),
              ),
            ),
            RaisedButton(
              child: Text('传递参数给原生View'),
              onPressed: () async {
                var result =
                await platforms[1].invokeMethod('getData', {'name': '鸿亿'});
                print("$result");
              },
            ),
          ],
        ),
        height: 150,
      ));
      listViews.add(
        TitleView(
          titleTxt: 'ios MethodChannel通讯 Native->Flutter',
        ),
      );
      listViews.add(Container(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              height: 80,
              child: UiKitView(
                viewType: 'ThreeView',
                creationParamsCodec: StandardMessageCodec(),
              ),
            ),
          ],
        ),
        height: 150,
      ));
    }
}}
