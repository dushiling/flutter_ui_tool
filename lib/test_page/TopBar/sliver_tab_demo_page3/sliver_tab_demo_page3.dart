import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_tool/test_page/TopBar/sliver_tab_demo_page3/sliver_tab_child_page.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

final kMinHeight = 30.0;

/// 高级版 Sliver Tab
class SliverTabDemoPage3 extends StatefulWidget {
  @override
  _SliverTabDemoPageState createState() => _SliverTabDemoPageState();
}

class _SliverTabDemoPageState extends State<SliverTabDemoPage3>
    with TickerProviderStateMixin {
  TabController? tabController;

  final PageController pageController = new PageController();
  final int tabLength = 4;
  final double tabIconSize = 30;
  final List<List> dataList = [
    List.filled(30, null),
    List.filled(2, null),
    List.filled(8, null),
    List.filled(40, null),
  ];

  double minHeight = kToolbarHeight;
  double shrinkOffset = 0;

  final ScrollController controller =
      ScrollController(initialScrollOffset: -70);

  List<Widget> renderTabs(double shrinkOffset) {
    double offset = (shrinkOffset > tabIconSize) ? tabIconSize : shrinkOffset;
    if (minHeight == kToolbarHeight) {
      offset = 0;
    }
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

  List<Widget> renderPages() {
    return List.generate(dataList.length, (index) {
      return SliverTabChildPage(index, dataList[index]);
    });
  }

  @override
  void initState() {
    tabController = new TabController(length: tabLength, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:SLAppBarWidget(title: "sliver_tab_Extent"),
      body: new NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics is PageMetrics) {
            return false;
          }
          if (notification.metrics is FixedScrollMetrics) {
            if (notification.metrics.axisDirection == AxisDirection.left ||
                notification.metrics.axisDirection == AxisDirection.right) {
              return false;
            }
          }
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.idle) {
              if (notification.metrics.pixels <= 0) {
                minHeight = kToolbarHeight;
                shrinkOffset = 0;
                setState(() {});
              } else {
                minHeight = kMinHeight;
                shrinkOffset = kMinHeight;
                setState(() {});
              }
            }
          } else if (notification is ScrollUpdateNotification) {
            if (notification.metrics.pixels < 0 &&
                minHeight != kToolbarHeight) {
              var cur = minHeight - notification.metrics.pixels / 3;
              if (shrinkOffset > 0) {
                shrinkOffset =
                    (shrinkOffset + notification.metrics.pixels / 3).abs();
              }
              if (cur > kToolbarHeight) {
                cur = kToolbarHeight;
              }
              if (minHeight != cur) {
                minHeight = cur.abs();
                setState(() {});
              }
            } else if (notification.metrics.pixels >= 0 &&
                minHeight != kMinHeight) {
              var cur = kToolbarHeight - notification.metrics.pixels / 2;
              shrinkOffset = notification.metrics.pixels / 2;
              if (minHeight != cur) {
                minHeight = (cur > kMinHeight) ? cur : kMinHeight;
                setState(() {});
              }
            }
          }
          return false;
        },
        child: Column(
          children: <Widget>[
            Container(
              height: minHeight,
              color: ColorsV.primaryColor,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.cyanAccent,
                unselectedLabelColor: Colors.white.withAlpha(100),
                labelColor: Colors.cyanAccent,
                tabs: renderTabs(shrinkOffset),
                onTap: (index) {
                  setState(() {});
                  pageController.jumpToPage(index);
                },
              ),
            ),
            new Expanded(
              child: PageView(
                //physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  tabController!.animateTo(index);
                },
                controller: pageController,
                children: renderPages(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

