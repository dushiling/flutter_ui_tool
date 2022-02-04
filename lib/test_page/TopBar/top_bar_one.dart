import 'package:flutter/material.dart';

import 'child/keep_alive.dart';
class TopBarOnePage extends StatefulWidget {
  const TopBarOnePage({Key? key}) : super(key: key);

  @override
  _TopBarOnePageState createState() => _TopBarOnePageState();
}

class _TopBarOnePageState extends State<TopBarOnePage>  with SingleTickerProviderStateMixin{

  late TabController controller;

  final List<Tab> titleTabs = <Tab>[
    Tab(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Icon(Icons.map), Text("map")],
        ),
      ),
    ),
    Tab(
      child: Text("add"),
      icon: Icon(Icons.add),
    ),
    Tab(
      text: "refresh",
    )
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: titleTabs.length, vsync: this)
      ..addListener(() {
        // 监听滑动/点选位置
        if (controller.index.toDouble() == controller.animation!.value) {
          print('controller.index====${controller.index}');
          // switch (controller.index) {
          //   case 0:
          //     print('0');
          //     break;
          //   case 1:
          //     print('1');
          //     break;
          //   case 2:
          //     print('2');
          //     break;
          //   default:
          //     break;
          // }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TopBarOne-NoScroll"),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: titleTabs,
            // setup the controller
            controller: controller,
            isScrollable: true,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
          ),
      ),
      body: TabBarView(
        // add tabs as widgets
        children: <Widget>[KeepAliveWidget(), KeepAliveWidget(), KeepAliveWidget()],
        // set the controller
        controller: controller,
        // TabBarView 默认支持手势滑动，若要禁止设置 NeverScrollableScrollPhysics
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }




}
