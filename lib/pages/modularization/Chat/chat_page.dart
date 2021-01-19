import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/modularization/Chat/chat_message_page.dart';
import 'package:flutterstudy/pages/modularization/Chat/chat_search_page.dart';
import 'package:flutterstudy/pages/modularization/Chat/model/chat_model.dart';
import 'package:flutterstudy/util/colors.dart';
import 'package:flutterstudy/widgets/badge_text.dart';
import 'package:flutterstudy/widgets/custom_search_text.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> _items = List<Chat>();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items.add(Chat(
        id: 1,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "2",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
    _items.add(Chat(
        id: 2,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "2",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
    _items.add(Chat(
        id: 3,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "2",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
    _items.add(Chat(
        id: 3,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "2",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
    _items.add(Chat(
        id: 3,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "2",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
    _items.add(Chat(
        id: 3,
        name: "Baffin",
        message: "Running Xcode build...",
        time: "3.30 AM",
        count: "",
        headerImage: "https://profile.csdnimg.cn/5/5/A/0_weixin_43135850"));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///PreferredSize可用于自定义导航栏
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios), onPressed: () {
                      Navigator.pop(context);
                    })),
                Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '聊天',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 20,
                  ),
                )
              ],
            ),
            CustomSearchText(
              text: "Search with love ...",
              enable: false,
              callback: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return ChatSearchPage(items: _items,);
                }));
              },
              controller: _textEditingController,
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatListItemWidget(
                chat: _items[index],
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return ChatMessagePage(model: _items[index],);
                  }));
                },
              );
            }),
      ),
    );
  }
}


class ChatListItemWidget extends StatelessWidget {
  final Chat chat;
  final VoidCallback callback;

  const ChatListItemWidget({this.chat, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 1,
              child: ClipOval(
                child: Image.network('${chat.headerImage}',),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    chat.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    chat.message,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    chat.time,
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  chat.count.isNotEmpty
                      ? BadgeText(
                    text: chat.count,
                    color: HSLColors.flamingo,
                  )
                      : SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
