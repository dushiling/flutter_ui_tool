import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';

import 'child/link_flexible_space_bar.dart';
import 'child/link_sliver_header.dart';


class LinkSliverDemoPage extends StatefulWidget {
  @override
  _LinkSliverDemoPageState createState() => _LinkSliverDemoPageState();
}

class _LinkSliverDemoPageState extends State<LinkSliverDemoPage> {
  List functionList=['粉丝','关注','视频','等级'];

  renderBottomItem(int index) {
    return Expanded(
      child: new InkWell(
        onTap: (){TostUtil.showToast('点击了${functionList[index]}');},
        child: Container(
          alignment: Alignment.centerLeft,
          child: Center(
            child: new Text(
              functionList[index],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: Container(),
                expandedHeight: 220.0,
                flexibleSpace: LinkFlexibleSpaceBar(
                  centerTitle: false,
                  title: Container(
                    margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                    child: new Text("杜杜"),
                  ),
                  image: "assets/images/sidebar1/userImage.png",
                  bottom: List.generate(4, (index) {
                    return renderBottomItem(index);
                  }),
                  titlePadding: EdgeInsets.all(0),
                ),
                pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: 'Add new entry',
                    onPressed: () {},
                  ),
                ],
              ),
            ];
          },
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: CustomScrollView(
              ///回弹效果
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: <Widget>[
                LinkSliverHeader(
                  initLayoutExtent: 60,
                  containerExtent: 120,
                  triggerPullDistance: 120,
                  pinned: false,
                ),

                ///列表区域
                SliverSafeArea(
                  sliver: SliverList(
                    ///代理显示
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Card(
                          child: new Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            child: new Text("Item  $index"),
                          ),
                        );
                      },
                      childCount: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
