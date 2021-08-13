import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/expand/Animation/widgets/wave_wadget.dart';
import 'package:flutterstudy/util/utils.dart';
import 'package:flutterstudy/widgets/load_image.dart';
import 'model/element_home_model.dart';
import 'widgets/home_list_card.dart';

class ElementHomePage extends StatefulWidget {
  @override
  _ElementHomePageState createState() => _ElementHomePageState();
}

class _ElementHomePageState extends State<ElementHomePage> {
  List<HomeList> homeList = HomeList.homeList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      key: const Key('element_home_page'),
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: _sliverBuilder(),
    ));
  }

  bool isDark = false;

  List<Widget> _sliverBuilder() {
    isDark = context.isDark;
    return <Widget>[
      SliverAppBar(
        brightness: Brightness.light,
        backgroundColor: HSLColors.caribbean_color,
        expandedHeight: 250.0,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('基础元素'),
          background: isDark
              ? Container(
                  color: Colors.black,
                )
              : headerView(),
          titlePadding:
              const EdgeInsetsDirectional.only(start: 16.0, bottom: 14.0),
          collapseMode: CollapseMode.pin,
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.7),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return GetGridViewItem(
            listData: homeList[index],
            color: Colors.primaries[index % Colors.primaries.length],
            callBack: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      homeList[index].navigateScreen,
                ),
              );
            },
          );
        }, childCount: homeList.length),
      ),
    ];
  }

  Widget headerView() {
    return Stack(
      children: [
        LoadAssetImage(
            'element/BasicsBg'),
        WaveWidget(
          size: Size(context.width, context.height),
          waveAmplitude: 15,
        ),
      ],
    );
  }
}

class GetGridViewItem extends StatelessWidget {
  const GetGridViewItem({Key key, this.listData, this.callBack, this.color})
      : super(key: key);

  final HomeList listData;
  final VoidCallback callBack;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 0),
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
