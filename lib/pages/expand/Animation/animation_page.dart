import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/expand/Animation/widgets/custom_animation_page.dart';
import 'package:flutterstudy/pages/expand/Animation/widgets/system_animation_widgets.dart';
import 'package:flutterstudy/util/colors.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('动画'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: '系统动画组件',
                  ),
                  Tab(
                    text: '自定义动画',
                  ),
                ],

                indicatorColor: Colors.white,
                //指示器颜色
                indicatorWeight: 2,
                //指示器高度
                indicatorSize: TabBarIndicatorSize.label,
                //指示器大小,底部边框
                labelColor: HSLColors.flamingo,
                //选中label颜色
                unselectedLabelColor: Colors.white, //未选中label颜色
              ),
            ),
            body: new TabBarView(children: <Widget>[
              SystemAnimationWidgets(),
              CustomAnimationPage()
            ])));
  }
}
