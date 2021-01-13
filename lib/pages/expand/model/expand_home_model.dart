import 'package:flutter/widgets.dart';
import 'package:flutterstudy/pages/expand/Animation/animation_page.dart';
import 'package:flutterstudy/pages/expand/stateManagement/state_management_page.dart';
import '../nativeInteraction/native_interaction_page.dart';
import '../NetWork/network_page.dart';
class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title = '',
    this.subTitle = '',
    this.subImagePath = ''
  });

  Widget navigateScreen;
  String imagePath;
  String title;
  String subTitle;
  String subImagePath;

  static List<HomeList> homeList = [
    HomeList(
      title: '状态管理及事件处理',
      imagePath: 'common/wave_bg',
      subTitle: 'State Management & Event Handling',
      subImagePath: 'element/element_layout',
      navigateScreen: StateManagementPage(),
    ),
  HomeList(
      title: '网络请求',
      imagePath: 'common/wave_bg',
      subTitle: 'State Management',
      subImagePath: 'element/element_layout',
      navigateScreen: NatworkPage(),
    ),
    HomeList(
      title: '动画',
      imagePath: 'common/wave_bg',
      subTitle: 'State Management',
      subImagePath: 'element/element_layout',
      navigateScreen: AnimationPage(),
    ),
    HomeList(
      title: '原生交互',
      imagePath: 'common/wave_bg',
      subTitle: 'Native Interaction',
      subImagePath: 'element/element_layout',
      navigateScreen: NativeInteractionPage(),
    ),
  ];
}
