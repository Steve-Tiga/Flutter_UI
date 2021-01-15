import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/about/about_home_page.dart';
import 'package:flutterstudy/index_provider.dart';
import 'package:flutterstudy/pages/modularization/modularization_home_page.dart';
import 'package:flutterstudy/widgets/load_image.dart';
import 'package:flutterstudy/util/colors.dart';
import 'package:flutterstudy/pages/element/element_home_page.dart';
import 'package:flutterstudy/util/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutterstudy/pages/expand/expand_home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  static const double _imageSize = 25.0;
  List<Widget> _pageList;
  final List<String> _appBarTitles = ['元素','控件','拓展','关于'];
  final PageController _pageController = PageController();

  List<BottomNavigationBarItem> _list;
  List<BottomNavigationBarItem> _listDark;

  //状态管理
  IndexProvider provider = IndexProvider();

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initData() {
    _pageList = [
      ElementHomePage(),
      ModularizationHomePage(),
      ExpandHomePage(),
      AboutHomePage(),
    ];
  }
  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const _tabImages = [
        [
          LoadAssetImage('tabBar/element_tabbar', width: _imageSize, color: HSLColors.unselected_item_color,),
          LoadAssetImage('tabBar/element_tabbar', width: _imageSize, color: HSLColors.app_main,),
        ],
        [
          LoadAssetImage('tabBar/module_tabbar', width: _imageSize, color: HSLColors.unselected_item_color,),
          LoadAssetImage('tabBar/module_tabbar', width: _imageSize, color: HSLColors.app_main,),
        ],
        [
          LoadAssetImage('tabBar/expand_tabbar', width: _imageSize, color: HSLColors.unselected_item_color,),
          LoadAssetImage('tabBar/expand_tabbar', width: _imageSize, color: HSLColors.app_main,),
        ],
        [
          LoadAssetImage('tabBar/about_tabbar', width: _imageSize, color: HSLColors.unselected_item_color,),
          LoadAssetImage('tabBar/about_tabbar', width: _imageSize, color: HSLColors.app_main,),
        ]
      ];
      _list = List.generate(_tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          label: _appBarTitles[i],
        );
      });
    }
    return _list;
  }

  List<BottomNavigationBarItem> _buildDarkBottomNavigationBarItem() {
    if (_listDark == null) {
      const _tabImagesDark = [
        [
          LoadAssetImage('tabBar/element_tabbar', width: _imageSize),
          LoadAssetImage('tabBar/element_tabbar', width: _imageSize, color: HSLColors.dark_app_main,),
        ],
        [
          LoadAssetImage('tabBar/module_tabbar', width: _imageSize),
          LoadAssetImage('tabBar/module_tabbar', width: _imageSize, color: HSLColors.dark_app_main,),
        ],
        [
          LoadAssetImage('tabBar/expand_tabbar', width: _imageSize),
          LoadAssetImage('tabBar/expand_tabbar', width: _imageSize, color: HSLColors.dark_app_main,),
        ],
        [
          LoadAssetImage('tabBar/about_tabbar', width: _imageSize),
          LoadAssetImage('tabBar/about_tabbar', width: _imageSize, color: HSLColors.dark_app_main,),
        ]
      ];

      _listDark = List.generate(_tabImagesDark.length, (i) {
        return BottomNavigationBarItem(
          icon: _tabImagesDark[i][0],
          activeIcon: _tabImagesDark[i][1],
          label: _appBarTitles[i],
        );
      });
    }
    return _listDark;
  }
  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    return ChangeNotifierProvider<IndexProvider>(
      create: (_) => provider,
      child: WillPopScope(
        child: Scaffold(
            bottomNavigationBar: Consumer<IndexProvider>(
              builder: (_, provider, __) {
                return BottomNavigationBar(
                  backgroundColor: context.backgroundColor,
                  items: isDark ? _buildDarkBottomNavigationBarItem() : _buildBottomNavigationBarItem(),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: provider.value,
                  elevation: 5.0,
                  iconSize: 21.0,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: isDark ? HSLColors.dark_unselected_item_color : HSLColors.unselected_item_color,
                  onTap: (index) => _pageController.jumpToPage(index),
                );
              },
            ),
            // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
            body: PageView(
              physics: const NeverScrollableScrollPhysics(), // 禁止滑动
              controller: _pageController,
              onPageChanged: (int index) => provider.value = index,
              children: _pageList,
            )
        ),
      ),
    );
  }
}
