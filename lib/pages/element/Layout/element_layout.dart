import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/Layout/widget/IndexedStack_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/aspectRatio_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/column_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/container_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/flexible_expanded_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/fractionallySizedBox_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/row_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/stack_layout_view.dart';
import 'package:flutterstudy/pages/element/Layout/widget/wrap_layout_View.dart';
import 'package:flutterstudy/res/colors.dart';
import 'package:flutterstudy/res/resources.dart';

class ElementLayoutPage extends StatefulWidget {
  @override
  _ElementLayoutPageState createState() => _ElementLayoutPageState();
}

class _ElementLayoutPageState extends State<ElementLayoutPage> with AutomaticKeepAliveClientMixin{


  List<Widget> commonLayouts = <Widget>[];//布局组件
  List<Widget> weightLayouts = <Widget>[];//定位权重组件

  @override
  bool get wantKeepAlive =>true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    addListViews();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: HSLColors.bg_color,
          appBar: AppBar(
            title: Text('布局'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: '布局组件',),
                Tab(text: '定位装饰权重组件',),
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
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return commonLayouts[index];
              },
              itemCount: commonLayouts.length,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return weightLayouts[index];
              },
              itemCount: weightLayouts.length,
            )
          ]),
        ));
  }

  void addListViews() {
    commonLayouts.add(RowLayoutView());
    commonLayouts.add(ColumnLayoutView());
    commonLayouts.add(StackLayoutView());
    commonLayouts.add(IndexedStackDemo());
    commonLayouts.add(WrapLayoutView());

    weightLayouts.add(ContainerLayoutView());
    weightLayouts.add(AspectRatioLayoutView());
    weightLayouts.add(FractionallySizedBoxLayoutView());
    weightLayouts.add(FlexibleExpandedLayoutView());
  }
}
