import 'package:flutter/widgets.dart';
import 'package:flutterstudy/pages/modularization/Chat/chat_page.dart';
import 'package:flutterstudy/pages/modularization/Lottery/page/lotteryPage.dart';
import 'package:flutterstudy/pages/modularization/Lottie/lottie_animation_demo.dart';

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
      subTitle: '自定义聊天页面',
      navigateScreen: ChatPage(),
    ),
    ModularizationList(
      title: '转盘抽奖',
      imagePath: 'element/BasicsBg',
      subTitle: '转盘抽奖，支持自定义抽奖结果（比如根据后台返回判断结果）',
      navigateScreen: LotteryPage(),
    ),
    ModularizationList(
      title: 'Lottie动画页面',
      imagePath: 'element/BasicsBg',
      subTitle: '基于Lottie实现动画，找了个烟花特效的',
      navigateScreen: LottieAnimationPage(),
    ),
    ModularizationList(
      title: '联系人列表',
      imagePath: 'element/BasicsBg',
      subTitle: '可点击indexBar进行滑动定位',
      // navigateScreen: WindowVideoPage(dataSource: 'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4',),
      navigateScreen: ChatPage(),
    ),
    // ModularizationList(
    //   title: '视频播放',
    //   imagePath: 'element/BasicsBg',
    //   subTitle: '基于flutter_tencentplayer的视频播放页面',
    //   // navigateScreen: WindowVideoPage(dataSource: 'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4',),
    //   navigateScreen: ChatPage(),
    // ),
    // ModularizationList(
    //   title: '图表页面',
    //   imagePath: 'element/BasicsBg',
    //   subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
    //   navigateScreen: ChatPage(),
    // ),
    // ModularizationList(
    //   title: '购物页面',
    //   imagePath: 'element/BasicsBg',
    //   subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
    //   navigateScreen: ChatPage(),
    // ),
    // ModularizationList(
    //   title: '底部导航栏页面',
    //   imagePath: 'element/BasicsBg',
    //   subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
    //   navigateScreen: ChatPage(),
    // ),
    // ModularizationList(
    //   title: '购物车',
    //   imagePath: 'element/BasicsBg',
    //   subTitle: '聊天页面聊天页面聊天页面聊天页面聊天',
    //   navigateScreen: ChatPage(),
    // ),
    ];
}
