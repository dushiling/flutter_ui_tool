
import 'package:flutter/material.dart';

import 'child/bubble_bottom_bar.dart';
import 'child/each_view.dart';

class BubbleBottomBarPage extends StatefulWidget {
  BubbleBottomBarPage({Key? key}) : super(key: key);

  @override
  createState() => _BubbleBottomBarPageState();
}

class _BubbleBottomBarPageState extends State<BubbleBottomBarPage>
    with SingleTickerProviderStateMixin {
  late int currentIndex;

  List<Widget> list = [];

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
    list
      ..add(EachView('首页'))
      ..add(EachView('分类'))
      ..add(EachView('购物车'))
      ..add(EachView('我的'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Colors.white,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("首页")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("分类")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("购物车")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("我的"))
        ],
      ),
    );
  }
}
