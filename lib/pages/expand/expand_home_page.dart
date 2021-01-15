import 'package:flutter/material.dart';
import 'model/expand_home_model.dart';
import 'package:flutterstudy/pages/element/widgets/home_list_card.dart';

class ExpandHomePage extends StatefulWidget {
  @override
  _ExpandHomePageState createState() => _ExpandHomePageState();
}

class _ExpandHomePageState extends State<ExpandHomePage> {
  List<HomeList> homeList = HomeList.homeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          'Flutter拓展',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: new ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 150,
              child: GetListViewItem(
                color: Colors.primaries[index % Colors.primaries.length],
                listData: homeList[index],
                callBack: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          homeList[index].navigateScreen,
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}

class GetListViewItem extends StatelessWidget {
  const GetListViewItem({Key key, this.listData, this.callBack, this.color})
      : super(key: key);

  final HomeList listData;
  final VoidCallback callBack;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18, bottom: 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          HomePageCard(
            color: color,
            bgImagePath: listData.imagePath,
            shadowColor: Colors.grey,
            title: listData.title,
            subTitle: listData.subTitle,
            subImagePath: listData.subImagePath,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                callBack();
              },
            ),
          ),
        ],
      ),
    );
  }
}
