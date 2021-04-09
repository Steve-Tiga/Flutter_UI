import 'package:flutter/widgets.dart';
import 'package:flutterstudy/pages/element/Button/button_view.dart';
import 'package:flutterstudy/pages/element/Checkbox/checkbox_page.dart';
import 'package:flutterstudy/pages/element/Image/image_page.dart';
import 'package:flutterstudy/pages/element/Layout/element_layout.dart';
import 'package:flutterstudy/pages/element/ProgressIndicator/progressIndicator_page.dart';
import 'package:flutterstudy/pages/element/Slider/slider_page.dart';
import 'package:flutterstudy/pages/element/Switch/switch_page.dart';
import 'package:flutterstudy/pages/element/Text/text_page.dart';


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
      title: '布局',
      imagePath: 'common/wave_bg',
      subTitle: 'Layout',
      subImagePath: 'element/element_layout',
      navigateScreen: ElementLayoutPage(),
    ),
    HomeList(
      title: '文本',
      subTitle: 'Text',
      imagePath: 'common/wave_bg',
      subImagePath: 'element/element_text',
      navigateScreen: TextPage(),
    ),
    HomeList(
      title: '按钮',
      imagePath: 'common/wave_bg',
      subTitle: 'Button',
      subImagePath: 'element/element_button',
      navigateScreen: ButtonView(),
    ),
    HomeList(
      title: '图片',
      imagePath: 'common/wave_bg',
      subTitle: 'image',
      subImagePath: 'element/element_layout',
      navigateScreen: ImagePage(),
    ),
    HomeList(
      title: '单/复选',
      imagePath: 'common/wave_bg',
      subTitle: 'Chackbox',
      subImagePath: 'element/element_layout',
      navigateScreen: ChackboxPage(),
    ),
    HomeList(
      title: '滑块',
      subTitle: 'Slider',
      imagePath: 'common/wave_bg',
      subImagePath: 'element/element_text',
      navigateScreen: SliderPage(),
    ),
    HomeList(
      title: '开关',
      imagePath: 'common/wave_bg',
      subTitle: 'Switch',
      subImagePath: 'element/element_button',
      navigateScreen: SwitchPage(),
    ),
    HomeList(
      title: '进度',
      imagePath: 'common/wave_bg',
      subTitle: 'ProgressIndicator',
      subImagePath: 'element/element_button',
      navigateScreen: ProgressIndicatorPage(),
    ),

  ];
}
