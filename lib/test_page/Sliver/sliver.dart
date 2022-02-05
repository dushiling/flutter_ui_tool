import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_ui_tool/config/custom_icon.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/child/conves_child/custom_appbar_sample.dart';
import 'package:flutter_ui_tool/test_page/delegates/sliver_appbar_delegate.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';


class SliverPage extends StatefulWidget {
  SliverPage({Key? key}) : super(key: key);

  @override
  createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> with SingleTickerProviderStateMixin {
  List bannerImages = [
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
  ];

  List<String> titleTabs = [
    '家具家电',
    "服装",
    "婴儿用品",
    "手机",
    "电脑",
    "生活用品",
    "美妆",
    "厨房用品"
  ];

  List<Tab> tabs = [];
  late TabController controller;
  int currentIndex = 1;

  ScrollController scrollController = ScrollController();

  /// 透明度 取值范围[0,1]
  double navAlpha = 0;
  double headerHeight =0;
  double bannerHeight = 200;
  double viewHeight = 100;

  Brightness brightness = Brightness.dark;
  Color barIconColor = Colors.white;

  @override
  void initState() {
    super.initState();

    headerHeight = viewHeight + bannerHeight;

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset <= headerHeight && offset >= 0) {
        setState(() {
          navAlpha = 1 - (headerHeight - offset) / headerHeight;
          if (navAlpha > 0.5) {
            brightness = Brightness.light;
          } else {
            brightness = Brightness.dark;
          }
          barIconColor = Color.fromARGB(255, (255 - 255 * navAlpha).toInt(),
              (255 - 255 * navAlpha).toInt(), (255 - 255 * navAlpha).toInt());
        });
      }
    });

    tabs = titleTabs.map((title) => Tab(text: "$title")).toList();

    controller = TabController(
        length: titleTabs.length, vsync: this, initialIndex: currentIndex)
      ..addListener(() {
        // 监听滑动/点选位置
        if (controller.index.toDouble() == controller.animation!.value) {
          setState(() => currentIndex = controller.index);
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                        brightness: brightness,
                        automaticallyImplyLeading: false,
                        elevation: 0.0,
                        pinned: true,
                        backgroundColor: Colors.white,
                        forceElevated: innerBoxIsScrolled,
                        expandedHeight: headerHeight - SizeUtil.topSafeHeight,
                        centerTitle: true,
                        title: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: barIconColor),
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Row(children: <Widget>[
                              Icon(Icons.search, color: Colors.grey[300]),
                              Text('关键字',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[300]))
                            ])),
                        leading: Container(
                            child: Icon(CustomIcon.xianyu,
                                color: barIconColor, size: 45),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 20)),
                        actions: <Widget>[
                          IconButton(
                              icon: Icon(CustomIcon.scan, color: barIconColor),
                              onPressed: () {})
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(children: <Widget>[
                            /// 顶部banner部分
                            Container(
                                height: bannerHeight,
                                child: Swiper(
                                    itemBuilder: (context, index) =>
                                        Image.network(bannerImages[index],fit: BoxFit.fill),
                                    itemCount: 3,
                                    pagination: SwiperPagination(
                                        builder: SwiperPagination.fraction,
                                        alignment: Alignment.bottomRight),
                                    autoplay: true)),

                            /// TabBar上面部分，（如果TabBar上面纵向有多个控件应尽可能多的将控件放到此处）
                            Container(
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text('这用在tabBar上面的功能部分',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0)),
                                height: viewHeight,
                                color: Colors.pink.withOpacity(0.4))
                          ]),
                        ))),

                /// TabBar部分
                SliverPersistentHeader(
                    delegate: SliverAppBarDelegate(TabBar(
                        tabs: tabs,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        controller: controller,
                        isScrollable: true,
                        indicatorColor: Colors.yellowAccent)),
                    // 悬停到顶部
                    pinned: true)
              ];
            },
            body: TabBarView(
                controller: controller,
                children: titleTabs.map((view) {
                  return BottomGridView(title: titleTabs[currentIndex]);

                }).toList())));
  }
}

class BottomGridView extends StatefulWidget {
  final int? index;
  final String? title;

  BottomGridView({Key? key,  this.index, this.title}) : super(key: key);

  @override
  createState() => BottomGridViewState();
}

class BottomGridViewState extends State<BottomGridView>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List? _list = List.generate(90, (index) {
      return index;
    });
    // 生成一个列表
    List<Widget> _getGridList() {
      return _list.map((item) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/SliverAppBar_bg1.png',
                  fit: BoxFit.fill,
                ) ,
              ),
              Text('item ${_list.indexOf(item)}',style: TextStyle(fontSize: 26),)
            ],
          ),
          color: Colors.green[200],
        );
      }).toList();
    }


    return Scaffold(
      body: GridView.count(
        children: _getGridList(),
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 20,
        // 水平距离
        mainAxisSpacing: 20,
        // 垂直距离
        childAspectRatio: 3.7/4, // 宽高比例
      ),
    );
  }



  @override
  bool get wantKeepAlive => true;
}
