import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/data.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {


  @override
  Widget build(BuildContext context) {
    var _tabs = <String>[];
    _tabs = <String>[
      "文章",
      "收藏",
      "关注",
    ];

    return Scaffold(
      body:

      /// 加TabBar
      DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: ColorsV.primaryColor,
                  leading: new IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: const Text('资料'),
                  centerTitle: false,
                  pinned: true,
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 230.0,

                  elevation: 10,
                  //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                  forceElevated: innerBoxIsScrolled,

                  actions: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        print("更多");
                      },
                    ),
                  ],

                  flexibleSpace: new FlexibleSpaceBar(
                    background: Image.network('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3496053885,3190325716&fm=26&gp=0.jpg', fit: BoxFit.fill),
                  ),

                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    indicatorColor: ColorsV.primaryColor,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              //SafeArea 适配刘海屏的一个widget
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                          NestedScrollView.sliverOverlapAbsorberHandleFor(
                              context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),

      /// 不加TabBar

//      new CustomScrollView(
//        slivers: <Widget>[
//          new SliverAppBar(
//            leading: new IconButton(
//              icon: Icon(Icons.arrow_back),
//              onPressed: () {},
//            ),
//
//            title: Text("标题"),
//
//            actions: <Widget>[
//              new IconButton(
//                icon: Icon(Icons.add),
//                onPressed: () {
//                  print("添加");
//                },
//              ),
//              new IconButton(
//                icon: Icon(Icons.more_horiz),
//                onPressed: () {
//                  print("更多");
//                },
//              ),
//            ],
//
//            expandedHeight: 230.0,
//            floating: false,
//            pinned: true,
//            snap: false,
//            brightness: Brightness.dark,
//
//            flexibleSpace: new FlexibleSpaceBar(
//              background: Image.asset("images/a.jpg", fit: BoxFit.fill),
//            ),
//
//          ),
//          new SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate: new SliverChildBuilderDelegate(
//              (context, index) => new ListTile(
//                    title: new Text("Item $index"),
//                  ),
//              childCount: 30,
//            ),
//          ),
//        ],
//      ),
    );
  }
}
