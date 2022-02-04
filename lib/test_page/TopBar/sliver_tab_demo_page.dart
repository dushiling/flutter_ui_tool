
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_tool/test_page/delegates/sliver_header_delegate.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

/// 低级版 Sliver Tab，还有 SliverTabDemoPage2
class SliverTabDemoPage extends StatefulWidget {
  @override
  _SliverTabDemoPageState createState() => _SliverTabDemoPageState();
}

class _SliverTabDemoPageState extends State<SliverTabDemoPage>
    with TickerProviderStateMixin {
  TabController? tabController;

  final ScrollController scrollController = new ScrollController();
  final int tabLength = 4;
  final double maxHeight = kToolbarHeight;
  final double minHeight = 30;
  final double tabIconSize = 30;
  final List dataList = [
    List.filled(30, null),
    List.filled(2, null),
    List.filled(8, null),
    List.filled(40, null),
  ];

  List<Widget> renderTabs(double shrinkOffset) {
    double offset = (shrinkOffset > tabIconSize) ? tabIconSize : shrinkOffset;
    return List.generate(tabLength, (index) {
      return Column(
        children: <Widget>[
          Opacity(
            opacity: 1 - offset / tabIconSize,
            child: Icon(
              Icons.map,
              size: tabIconSize - offset,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text(
                "Tab$index",
              ),
            ),
          )
        ],
      );
    });
  }

  renderListByIndex() {
    int indexTab = tabController!.index;
    var list = dataList[indexTab];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            child: new Container(
              height: 60,
              alignment: Alignment.centerLeft,
              child: new Text("Tab $indexTab Item $index"),
            ),
          );
        },
        childCount: list.length,
      ),
    );
  }

  @override
  void initState() {
    tabController = new TabController(length: tabLength, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title: "sliver_tab_NoScroll"),
      body: new Container(
        child: new CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: scrollController,
          slivers: <Widget>[
            ///动态放大缩小的tab控件
            SliverPersistentHeader(
              pinned: true,

              /// SliverPersistentHeaderDelegate 的实现
              delegate: SliverHeaderDelegate(
                  maxHeight: maxHeight,
                  minHeight: minHeight,
                  changeSize: true,
                  vSync: this,
                  snapConfig: FloatingHeaderSnapConfiguration(
                    curve: Curves.bounceInOut,
                    duration: const Duration(milliseconds: 10),
                  ),
                  builder: (BuildContext context, double shrinkOffset,
                      bool overlapsContent) {
                    return Container(
                      height: maxHeight,
                      color: ColorsV.primaryColor,
                      child: TabBar(
                        indicatorColor: Colors.cyanAccent,
                        unselectedLabelColor: Colors.white.withAlpha(100),
                        labelColor: Colors.cyanAccent,
                        controller: tabController,
                        tabs: renderTabs(shrinkOffset),
                        onTap: (index) {
                          setState(() {});
                          scrollController.animateTo(0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastOutSlowIn);
                        },
                      ),
                    );
                  }),
            ),
            renderListByIndex()
          ],
        ),
      ),
    );
  }
}


