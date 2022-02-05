
import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/alert_dialog_util.dart';

import 'child/bottom_bar_view.dart';

class BottomBarViewDemo extends StatefulWidget {
  BottomBarViewDemo({Key? key}) : super(key: key);

  @override
  createState() => _BottomBarViewDemoState();
}

class _BottomBarViewDemoState extends State<BottomBarViewDemo> with TickerProviderStateMixin{
  String title = '0';
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('BottomBarView')),
      body: Stack(
        children: <Widget>[
          Container(child: Text('$title')),
          bottomBar(),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(children: <Widget>[
      Expanded(child: SizedBox()),
      BottomBarView(
        tabIconsList: tabIconsList,
        addClick: () {
          AlertDialogUtil.showMessageDialog(context,tipTitle: '提示',message: '这里做点击+后需要的操作');
        },
        changeIndex: (index) =>
            setState(() => title = "${tabIconsList[index].index}"),
      )
    ]);
  }

  static List<TabIconData> tabIconsList = [
    TabIconData(
        icon: Image.asset('assets/images/tag_icons/tab_1.png'),
        selectedIcon: Image.asset('assets/images/tag_icons/tab_1s.png'),
        index: 0,
        isSelected: true,
        animationController: null),
    TabIconData(
        icon: Image.asset('assets/images/tag_icons/tab_2.png'),
        selectedIcon: Image.asset('assets/images/tag_icons/tab_2s.png'),
        index: 1,
        isSelected: false,
        animationController: null),
    TabIconData(
        icon: Image.asset('assets/images/tag_icons/tab_3.png'),
        selectedIcon: Image.asset('assets/images/tag_icons/tab_3s.png'),
        index: 2,
        isSelected: false,
        animationController: null),
    TabIconData(
        icon: Image.asset('assets/images/tag_icons/tab_4.png'),
        selectedIcon: Image.asset('assets/images/tag_icons/tab_4s.png'),
        index: 3,
        isSelected: false,
        animationController: null)
  ];
}
