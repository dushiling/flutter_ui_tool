import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/custom_icon.dart';
import 'package:flutter_ui_tool/config/data.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/utils/utils.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

import 'child/icon_text.dart';


class MemberPage extends StatefulWidget {

  MemberPage( {Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;


  double navAlpha = 0;
  late double headerHeight;
  ScrollController scrollController = ScrollController();

  String _phone = '0393-8800315';

  List<Map<String, dynamic>> orderTitles = [
    {'icon': Icons.all_inclusive, 'title': '全部'},
    {'icon': CustomIcon.no_payment, 'title': '待付款'},
    {'icon': CustomIcon.no_send, 'title': '待发货'},
    {'icon': CustomIcon.no_receive, 'title': '待收货'},
    {'icon': CustomIcon.comment, 'title': '待评价'}
  ];

  @override
  void initState() {
    super.initState();

    headerHeight = 170.0;

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset <= 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < headerHeight) {
        setState(() {
          navAlpha = 1 - (headerHeight - offset) / headerHeight;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(children: <Widget>[
          SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(children: <Widget>[
                _buildHeader(),
               SizedBox(height: 10),
                Material(
                    color: Colors.white,
                    child: Container(
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text('我的订单'),
                            onTap: () {},
                            leading: Icon(CustomIcon.order),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                        Row(
                            children: orderTitles.map((title) {
                          int index = orderTitles.indexOf(title);
                          if (index > 0) {
                            return Expanded(
                                child: IconText(
                                    onPressed: () {},
                                    text: '${title['title']}',
                                    icon: Icon(title['icon'])));
                          }
                          return Container();
                        }).toList())
                      ]),
                    )),
                SizedBox(height: 10),
                Material(
                    color: Colors.white,
                    child: Container(
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text('优惠券'),
                            onTap: () {
                              TostUtil.showToast('优惠券');
                              /// TODO
                            },
                            leading: Icon(CustomIcon.coupon),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('收货地址'),
                            onTap: () {},
                            leading: Icon(CustomIcon.address),
                            trailing: Icon(Icons.keyboard_arrow_right))
                      ]),
                    )),
                SizedBox(height: 10),
                Material(
                    color: Colors.white,
                    child: Container(
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text('客服电话'),
                            onTap: () => Utils.launchURL('tel:$_phone'),
                            leading: Icon(CustomIcon.custom_service),
                            trailing: Row(children: <Widget>[
                              Text(_phone),
                              SizedBox(width: 10.0),
                              Icon(Icons.keyboard_arrow_right)
                            ], mainAxisSize: MainAxisSize.min)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('门店'),
                            onTap: () {},
                            leading: Icon(Icons.home),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('关于商城'),
                            onTap: () {
                              // pushNewPage(context, AboutPage());
                            },
                            leading: Icon(CustomIcon.about),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                      ]),
                    )),
                SizedBox(height: 10),
                Material(
                    color: Colors.white,
                    child: Container(
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text('测试滑动导航栏渐变'),
                            onTap: () => Utils.launchURL('tel:$_phone'),
                            leading: Icon(CustomIcon.custom_service),
                            trailing:Icon(Icons.keyboard_arrow_right)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('测试滑动导航栏渐变'),
                            onTap: () {},
                            leading: Icon(Icons.home),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('测试滑动导航栏渐变'),
                            onTap: () {
                              // pushNewPage(context, AboutPage());
                            },
                            leading: Icon(CustomIcon.about),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                        Container(height: 0.5, color: Colors.grey[200]),
                        ListTile(
                            title: Text('测试滑动导航栏渐变'),
                            onTap: () {
                              // pushNewPage(context, AboutPage());
                            },
                            leading: Icon(CustomIcon.about),
                            trailing: Icon(Icons.keyboard_arrow_right)),
                      ]),
                    ))
              ])),
          //透明渐变导航栏
          ToolBar(
              title: Text('会员'),
              backgroundColor: Color.fromRGBO(89, 175, 80, navAlpha),
              automaticallyImplyLeading: false)
        ]));
  }

  Widget _buildHeader() {
    return Container(
        height: headerHeight + SizeUtil.navigationBarHeight,
        child: Stack(children: <Widget>[
          ImageLoadView(backgroundImage,
              fit: BoxFit.fill,
              height: headerHeight + SizeUtil.navigationBarHeight,
              width: SizeUtil.width),
          Container(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    CircleAvatar(
                        backgroundImage: NetworkImage(avatarImage),
                        radius: 40.0),
                    Text('杜杜',
                        style: TextStyle(color: Colors.white, fontSize: 24.0))
                  ])),
              padding: EdgeInsets.only(top: SizeUtil.navigationBarHeight / 2))
        ]));
  }
}
