
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/child/each_view.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/SliverAppBar_bg1.png',
      navigateScreen: EachView('首页'),
    ),
    HomeList(
      imagePath: 'assets/images/SliverAppBar_bg2.png',
      navigateScreen: EachView('第二页'),
    ),
    HomeList(
      imagePath: 'assets/images/SliverAppBar_bg3.png',
      navigateScreen: EachView('第三页'),
    ),
    HomeList(
      imagePath: 'assets/images/SliverAppBar_bg4.png',
      navigateScreen: EachView('第四页'),
    ),
  ];
}
