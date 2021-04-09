import 'package:flutter/material.dart';
import 'package:flutterstudy/util/colors.dart';
import 'eventBus/event_bus.dart';
import 'model/state_management_model.dart';

class AddCountPage extends StatefulWidget {
  AddCountPage({Key key, this.pageType, this.model}) : super(key: key);
  final pageType;
  final StateModel model;

  @override
  _AddCountPageState createState() => _AddCountPageState();
}

//枚举
enum addCountPageType {
  UnknownType,
  EventBusType,
  NotificationType
}

class _AddCountPageState extends State<AddCountPage> {
  int _counter = 0;
  String _msg = '点击下方按钮发送通知：';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    switch (widget.pageType) {
      case addCountPageType.UnknownType:
        print('普通页面');
        break;
      case addCountPageType.EventBusType:
        bus.emit('addBadge', _counter);
        break;
      case addCountPageType.NotificationType:
        print('NotificationType');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (MyNotification notification) {
        setState(() {
          _msg += notification.msg+"  ";
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.model.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text('$_msg',style: Theme.of(context).textTheme.headline6,),

              Builder(
                builder: (context) => FlatButton(
                  color: HSLColors.app_main,
                  textColor: Colors.white,
                  height: 50,
                  onPressed: () => MyNotification('接受到通知').dispatch(context),
                  child: Text('发送通知'),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

//自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
