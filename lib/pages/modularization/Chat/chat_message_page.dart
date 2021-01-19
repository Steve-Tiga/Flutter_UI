import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterstudy/pages/modularization/Chat/model/chat_model.dart';
import 'package:flutterstudy/util/colors.dart';

class ChatMessagePage extends StatefulWidget {
  const ChatMessagePage({Key key, this.model}) : super(key: key);
  final Chat model;

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  List<Message> _items = List<Message>();
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _items.add(
        Message(name: "Charli", message: "Hi", time: "3.20 AM", isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "How are you?",
        time: "3.20 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "Its been long time",
        time: "3.20 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "Please have a look",
        time: "3.20 AM",
        isUser: false));
    _items.add(
        Message(name: "Charli", message: "Hey", time: "4.00 AM", isUser: true));
    _items.add(Message(
        name: "Charli",
        message: "Hi, I am good",
        time: "4.00 AM",
        isUser: true));
    _items.add(Message(
        name: "Charli",
        message: "I have completed the document",
        time: "4.10 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "Will share with you",
        time: "4.10 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli", message: "Yes Please", time: "3.35 AM", isUser: true));
    _items.add(Message(
        name: "Charli",
        message: "Hello again",
        time: "3.55 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "I have shared a file",
        time: "3.55 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli",
        message: "Please take a look at it",
        time: "3.55 AM",
        isUser: false));
    _items.add(Message(
        name: "Charli", message: "Sure", time: "3.35 AM", isUser: true));
    _items.add(Message(
        name: "Charli",
        message: "i will take a look at it",
        time: "3.35 AM",
        isUser: true));

    ///默认滑到最底部
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///自定义的渐变色导航栏
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  flex: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '${widget.model.name}',
                    style: new TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
              ],
            ),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [HSLColors.flamingo, HSLColors.lightening_yellow]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  controller: _controller,
                  reverse: false,
                  itemCount: _items.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (BuildContext context, int index) {
                    return ChatMessageItemWidget(
                      headerImage: widget.model.headerImage,
                      message: _items[index],
                    );
                  }),
            ),
            bottomSendMessage()
          ],
        ),
      ),
    );
  }

  Widget bottomSendMessage(){
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                side: BorderSide(color: Colors.grey, width: 2))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "发送消息",
                  hintStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.keyboard_voice),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: (){
              },
            )
          ],
        ),
      ),
    );
  }


}

class ChatMessageItemWidget extends StatelessWidget {
  final Message message;
  final String headerImage;

  const ChatMessageItemWidget({this.message, this.headerImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: !message.isUser ? getOtherBox() : getSelfBox());
  }

  Widget getOtherBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            headerImage,
            height: 40,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: ShapeDecoration(
                color: HSLColors.flamingo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: HSLColors.athens, width: 2))),
            child: Text(
              message.message,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget getSelfBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: ShapeDecoration(
                color: HSLColors.caribbean_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: HSLColors.athens, width: 2))),
            child: Text(
              message.message,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        ClipOval(
          child: Image.network(
            headerImage,
            height: 40,
          ),
        ),
      ],
    );
  }
}

class Message {
  final String name;
  final String message;
  final String time;
  final bool isUser;

  const Message({this.name, this.message, this.time, this.isUser});
}
