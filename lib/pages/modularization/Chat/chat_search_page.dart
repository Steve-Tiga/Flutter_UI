import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/modularization/Chat/model/chat_model.dart';
import 'package:flutterstudy/widgets/custom_search_text.dart';

class ChatSearchPage extends StatefulWidget {
  const ChatSearchPage({Key key,this.items}):super(key: key);
  final List<Chat> items;
  @override
  _ChatSearchPageState createState() => _ChatSearchPageState();
}

class _ChatSearchPageState extends State<ChatSearchPage> {
  List<Chat> _filtered = List<Chat>();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.addListener(_searchTextValue);
    _filtered = widget.items;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  _searchTextValue() {
    print("search field: ${_textEditingController.text}");
    if (_textEditingController.text.isEmpty) {
      setState(() {
        _filtered = widget.items;
      });
      return;
    }
    List<Chat> tempList = new List();
    for (int i = 0; i < _filtered.length; i++) {
      if (_filtered[i]
          .name
          .toLowerCase()
          .contains(_textEditingController.text.toLowerCase())) {
        tempList.add(_filtered[i]);
      }
    }
    setState(() {
      _filtered = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          getMainListViewUI(),
          getAppBarUI(),
        ],
      ),
    );
  }

  Widget getMainListViewUI(){
    return Container(
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            24,
      ),
      color: Colors.white,
      child: ListView.builder(
          itemCount: _filtered.length,
          padding: EdgeInsets.only(left: 24,right: 24),
          itemBuilder: (BuildContext context, int index) {
            return ChatSearchItemWidget(
              chat: _filtered[index],
              borderColor: Colors.black12,
              textColor: Colors.black,
              color: Colors.deepOrange,
            );
          }),
    );
  }

  Widget getAppBarUI(){
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 6,
              right: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios), onPressed: () {
                        Navigator.pop(context);
                  })),
              Expanded(
                  flex: 7,
                  child: CustomSearchText(
                    text: "Search with love ...",
                    enable: true,
                    callback: () {

                    },
                    controller: _textEditingController,
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class ChatSearchItemWidget extends StatelessWidget {
  final Chat chat;
  final Color borderColor;
  final Color textColor;
  final Color color;

  const ChatSearchItemWidget(
      {this.chat, this.color, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: <Widget>[
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
            flex: 6,
            child: Text(
              chat.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              chat.time,
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

