import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';

import 'child/select_text_item.dart';


class MySelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Material(
                  child: Container(
                      padding: EdgeInsets.only(top: SizeUtil.topSafeHeight),
                      width: double.infinity,
                      child: Column(children: <Widget>[
                        Row(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: ImageLoadView(
                                  'https://wx1.sinaimg.cn/bmiddle/0060lm7Tgy1g2qrfsns92j30u013y0x3.jpg',
                                  height: 56,
                                  width: 56,
                                  shape: BoxShape.circle)),
                          Text('杜杜 1197467923@qq.com', style: TextStyles.textWhite32),
                          Spacer(),
                          IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
                              onPressed: () {})
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("0", style: TextStyles.textWhite32),
                                    SizedBox(height: 5),
                                    Text("书币", style: TextStyles.textWhite32)
                                  ]),
                              Container(
                                  color: Color(0x50FFFFFF),
                                  width: 1,
                                  height: 23),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("0", style: TextStyles.textWhite32),
                                    SizedBox(height: 5),
                                    Text("礼券", style: TextStyles.textWhite32)
                                  ]),
                              Container(
                                  color: Color(0x50FFFFFF),
                                  width: 1,
                                  height: 23),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("签到", style: TextStyles.textWhite32),
                                    SizedBox(height: 5),
                                    Text("送礼券", style: TextStyles.textWhite32)
                                  ])
                            ]),
                        SizedBox(height: 15),
                      ])),
                  color: Color(0xFF545A65)),
              Stack(children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 80,
                    color: Color(0xFF545A65)),
                Positioned(
                    child: Container(
                        height: 100,
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFFFDECC3),
                              Color(0xFFF7CD7C)
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFF7CD7C),
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0)
                            ]),
                        child: InkWell(
                            child: Row(children: <Widget>[
                              Image.asset("assets/images/icon_me_vip.png",
                                  width: 18, height: 18),
                              SizedBox(height: 5),
                              Text("开通会员",
                                  style: TextStyle(
                                      color: Color(0xFF85682F), fontSize: 14)),
                              Spacer(),
                              Text("万本好书免费读",
                                  style: TextStyle(
                                      color: Color(0xFF85682F), fontSize: 14)),
                              SizedBox(height: 5),
                              Icon(Icons.keyboard_arrow_right,
                                  size: 16, color: Color(0xFF85682F))
                            ]),
                            onTap: () {})),
                    top: 15,
                    left: 15,
                    right: 15)
              ]),
              Container(
                child: Column(children: <Widget>[
                  SelectTextItem(
                      title: '我的账户',
                      content: '购买、充值记录',
                      onTap: () {},
                      leading: Icon(Feather.user,
                          size: 20, color: Colors.redAccent)),
                  SelectTextItem(
                      title: '我的任务',
                      content: '绑定手机送买书券',
                      leading: Icon(Feather.file_text,
                          size: 20, color: Colors.yellow),
                      onTap: () {})
                ]),
              ),
              SizedBox(height: 8),
              Container(
                child: Column(children: <Widget>[
                  SelectTextItem(
                      title: '兑换中心',
                      onTap: () {},
                      leading: Icon(Feather.gift,
                          size: 20, color: Colors.pinkAccent)),
                  SelectTextItem(
                      title: '我的消息',
                      content: '88',
                      leading: Icon(Feather.mail,
                          size: 20, color: Colors.lightGreen),
                      onTap: () {}),
                  SelectTextItem(
                      title: '我的评论',
                      leading: Icon(Feather.message_square,
                          size: 20, color: Colors.deepOrange),
                      onTap: () {})
                ]),
              ),
              SizedBox(height: 8),
              Container(
                child: Column(children: <Widget>[
                  SelectTextItem(
                      title: '云书架',
                      content: '同步书籍至云端',
                      onTap: () {},
                      leading:
                          Icon(Feather.cloud, size: 20, color: Colors.blue)),
                  SelectTextItem(
                      title: '我的下载',
                      leading: Icon(Feather.download,
                          size: 20, color: Colors.purple),
                      onTap: () {}),
                  SelectTextItem(
                      title: '最近阅读记录',
                      leading: Icon(Feather.book_open,
                          size: 20, color: Colors.greenAccent),
                      onTap: () {})
                ]),
              ),
              SizedBox(height: 8),
              Container(
                child: Column(children: <Widget>[
                  SelectTextItem(
                      title: '帮助与反馈',
                      onTap: () {},
                      leading: Icon(Feather.help_circle,
                          size: 20, color: Colors.orange)),
                  SelectTextItem(
                      title: '关于我们',
                      leading:
                          Icon(Feather.github, size: 20, color: Colors.black),
                      onTap: () {})
                ]),
              ),
              SizedBox(height: 8),
            ]),
          )),
    );
  }
}
