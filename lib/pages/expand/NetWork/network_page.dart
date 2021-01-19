import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';
import 'package:flutterstudy/pages/expand/NetWork/model/network_model.dart';
import 'package:flutterstudy/util/colors.dart';

class NatworkPage extends StatefulWidget {
  @override
  _NatworkPageState createState() => _NatworkPageState();
}

class _NatworkPageState extends State<NatworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('网络请求'),
        ),
        body: FutureBuilder(
          future: _getNews(),
            builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.hasData) {
            Response response = snapshot.data;
            NetworkModel model = NetworkModel.fromJson(response.data);
            return SingleChildScrollView(
              child: Column(
                children: [
                  ElementTitleView('json数据'),
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: HSLColors.athens,
                    height: 250,
                    child: SingleChildScrollView(
                        child: Text('${response.data.toString()}'),
                    ),
                  ),
                  ElementTitleView('json转model'),
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: HSLColors.athens,
                    height: 250,
                    child: SingleChildScrollView(
                      child: Text('${model.result.data}'),
                    ),
                  ),
                ],
              )
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

}

///请求接口获取数据
Future<Response> _getNews() async {
  await Future.delayed(Duration(seconds: 3), () {
    print("延时三秒后请求数据");
  });

  String url = "http://v.juhe.cn/toutiao/index";
  String key = "4c52313fc9247e5b4176aed5ddd56ad7";
  String type = "keji";
  Response response =
  await Dio().get(url, queryParameters: {"type": type, "key": key});
  return response;
}


