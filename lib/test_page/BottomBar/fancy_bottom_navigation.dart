import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';

import 'child/each_view.dart';


class FancyBottomNavigationBar extends StatefulWidget {
  FancyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  createState() => _FancyBottomNavigationBarState();
}

class _FancyBottomNavigationBarState extends State<FancyBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  int currentPage = 1;

  late List<Widget> list ;

  @override
  void initState() {
    super.initState();
    list=[];
    list
      ..add(EachView('Home'))
      ..add(EachView('Search'))
      ..add(EachView('Basket'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        onTabChangedListener: (int position) {
          setState(() {
            currentPage = position;
          });
        },
        circleColor: ColorsV.primaryColor,
        initialSelection: 1,
        inactiveIconColor: ColorsV.primaryColor,
        tabs: <TabData>[
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
      ),
    );
  }
}
