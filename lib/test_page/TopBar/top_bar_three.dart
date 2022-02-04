import 'package:flutter/material.dart';
class TopBarThreePage extends StatefulWidget {
  const TopBarThreePage({Key? key}) : super(key: key);

  @override
  _TopBarThreePageState createState() => _TopBarThreePageState();
}

class _TopBarThreePageState extends State<TopBarThreePage> with TickerProviderStateMixin{

  late TabController _tabController;
  static const List<Tab> _tabs = [
    Tab(text: "关注",),
    Tab(text: "推荐",),
    Tab(text: "热榜",),
    Tab(text: "财经",),
    Tab(text: "问答",),
    Tab(text: "科技",),
    Tab(text: "要闻",),
    Tab(text: "视频",),
    Tab(text: "娱乐",),
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
          title: Text("TopBarThree-Height44"),
          backgroundColor: Colors.green,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: Material(
              color: Colors.white70,
              child: TabBar(
                tabs: _tabs,
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _tabsContent,
          controller: _tabController,
        )
    );
  }
}
