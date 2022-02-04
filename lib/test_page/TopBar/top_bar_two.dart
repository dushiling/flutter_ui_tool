import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
class TopBarTwoPage extends StatefulWidget {
  const TopBarTwoPage({Key? key}) : super(key: key);

  @override
  _TopBarTwoPageState createState() => _TopBarTwoPageState();
}

class _TopBarTwoPageState extends State<TopBarTwoPage> with TickerProviderStateMixin{
  late TabController _tabController;

  static const List<Tab> _tabs = [
    Tab(text: "关注",icon: Icon(Icons.add_road)),
    Tab(text: "推荐",icon: Icon(Icons.add_shopping_cart)),
    Tab(text: "热榜",icon: Icon(Icons.adb_sharp)),
    Tab(text: "财经",icon: Icon(Icons.add_chart)),
    Tab(text: "问答",icon: Icon(Icons.add_call)),
    Tab(text: "科技",icon: Icon(Icons.ad_units)),
    Tab(text: "要闻",icon: Icon(Icons.add_alert)),
    Tab(text: "视频",icon: Icon(Icons.add_a_photo_outlined)),
    Tab(text: "娱乐",icon: Icon(Icons.accessibility_new)),
  ];

  final List<Widget> _tabsContent = [
    Text("关注"),
    Text("推荐"),
    Text("热榜"),
    Text("财经"),
    Text("问答"),
    Text("科技"),
    Text("要闻"),
    Text("视频"),
    Text("娱乐"),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TopBarTwo-Scroll"),
        backgroundColor: ColorsV.primaryColor,
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
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
        children: _tabsContent,
        // set the controller
        controller: _tabController,

      ),
    );
  }
}
