import 'package:flutter/widgets.dart';
import 'package:flutterstudy/pages/modularization/Chat/chat_page.dart';

class ModularizationList {
  ModularizationList(
      {this.navigateScreen,
      this.imagePath = '',
      this.title = '',
      this.subTitle = ''});

  Widget navigateScreen;
  String imagePath;
  String title;
  String subTitle;

  static List<ModularizationList> homeList = [
    ModularizationList(
      title: '聊天页面',
      imagePath: 'element/BasicsBg',
      subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
      navigateScreen: ChatPage(),
    ),
    ModularizationList(
      title: '图表页面',
      imagePath: 'element/BasicsBg',
      subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
      navigateScreen: ChatPage(),
    ),
    ModularizationList(
      title: '购物页面',
      imagePath: 'element/BasicsBg',
      subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
      navigateScreen: ChatPage(),
    ),
    ModularizationList(
      title: '底部导航栏页面',
      imagePath: 'element/BasicsBg',
      subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
      navigateScreen: ChatPage(),
    ),
    ];
}
