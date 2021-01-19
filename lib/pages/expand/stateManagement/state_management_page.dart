import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/expand/stateManagement/InheritedWidget_page.dart';
import 'package:flutterstudy/pages/expand/stateManagement/model/state_management_model.dart';
import 'package:flutterstudy/pages/expand/stateManagement/provider_demo_page.dart';
import 'package:flutterstudy/pages/expand/stateManagement/widgets/state_management_list_Item.dart';
import 'package:flutterstudy/util/colors.dart';
import 'package:oktoast/oktoast.dart';
import 'eventBus/event_bus.dart';
import 'addCount_page.dart';

class StateManagementPage extends StatefulWidget {
  @override
  _StateManagementPageState createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  List<StateModel> _items = List<StateModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items.add(StateModel(
        title: 'Function callback',
        des: '函数回调\n实现场景：点击该cell弹出弹框，点击其他cell跳转',
        count: 0));
    _items.add(StateModel(
        title: '事件总线-EventBus',
        des: '发布者-订阅者模式\n实现场景：点击下个页面增加按钮，改变小红点',
        count: 0));
    _items.add(StateModel(
        title: '通知-Notification',
        des: '通知冒泡:由子向父的传递\n实现场景：点击发送通知按钮，接收到通知内容',
        count: 0));
    _items.add(StateModel(
        title: '数据共享-InheritedWidget',
        des:
            '子widget从buildContext中获取并监听指定类型的父InheritedWidget，并跟随其重建而rebuild，实现数据共享',
        count: 0));
    _items.add(StateModel(
        title: '插件-Provider',
        des: '跨组件状态共享\n实现场景：局部共享，text和button共享curNum，全局参考暗黑模式',
        count: 0));

    bus.on('addBadge', (arg) {
      setState(() {
        _items.removeAt(1);
        _items.insert(
            1,
            StateModel(
                title: '事件总线-EventBus',
                des: '发布者-订阅者模式\n实现场景：点击下个页面增加按钮，改变小红点',
                count: arg));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('addBadge');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          '状态管理',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: new ListView.separated(
        itemCount: _items.length,
        physics: AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1, color: HSLColors.selago);
        },
        itemBuilder: (BuildContext context, int index) {
          return StateManageListItem(
            stateModel: _items[index],
            callback: () {
              if (index == 0) {
                showToast('callBack传值');
              } else if (index == 1) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AddCountPage(
                      pageType: addCountPageType.EventBusType,
                      model: _items[index],
                    ),
                  ),
                );
              } else if (index == 2) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AddCountPage(
                      pageType: addCountPageType.NotificationType,
                      model: _items[index],
                    ),
                  ),
                );
              } else if (index == 3) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => InheritedWidgetPage()),
                );
              } else if (index == 4) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => ProviderDemoPage()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
