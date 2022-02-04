import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';

class ImageWidget extends StatefulWidget {
  @override
  createState() => ImageWidgetState();
}



class ImageWidgetState extends State<ImageWidget> {
  int index = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Image")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Text('网络占位图片FadeInImage'),
            Divider(),

            /// 有的时候我们需要像Android那样使用一个占位图或者图片加载出错时显示某张特定的图片，这时候需要用到 FadeInImage 这个组件
            Row(children: <Widget>[

              ImageLoadView(
                'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                // radius: 20,
              ),
              FadeInImage.assetNetwork(
                  placeholder: 'assets/images/flutter_logo.png',
                  image:
                      'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(),
            Text('圆角图片'),
            Divider(),

            /// 给图片添加圆角
            Row(children: <Widget>[
              /// 使用裁剪来实现图片圆角
              ClipRRect(

                  /// 圆角
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fill,
                      height: 150,
                      width: 150)),

              /// 使用边框来实现图片圆角
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                          fit: BoxFit.cover)))
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),

            Divider(),
            Text('圆形图片'),
            Divider(),

            /// 给图片添加圆角
            Row(children: <Widget>[
              ClipOval(
                  child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fill,
                      height: 150,
                      width: 150)),
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                  radius: 75.0)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(),

            Text('GIF图片'),
            Divider(),

            /// 加载本地资源gif图片
            Image.asset('assets/images/timg.gif', height: 200, width: 200),

            Divider(),

            Text('asset资源图片'),

            Divider(),

            Image.asset('assets/images/flutter_logo.png',
                width: 130, //图片宽度
                height: 130, //图片高度
                /// 适配显示方式，fill表示宽高填充满
                fit: BoxFit.scaleDown),

            Divider(),
            Image.asset('assets/images/flutter_logo.png',
                width: 50,
                height: 50,

                /// 在宽高内重复平铺图片，直到铺满
                repeat: ImageRepeat.repeat),
            Divider(),
            Image(
                image: AssetImage("assets/images/flutter_logo.png"),
                height: 200,
                width: 200),
            Divider(),

            Text('颜色混合图片'),
            Divider(),

            Row(children: <Widget>[
              Image.asset('assets/images/flutter_logo.png',
                  width: 100,

                  /// 混合的颜色，和colorBlendMode一起使用
                  color: Colors.red,

                  /// 颜色和图片混合模式，功能较强大，其它模式参见官方文档或源码
                  colorBlendMode: BlendMode.overlay),
              Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100,
                  colorBlendMode: BlendMode.colorDodge,
                  color: Colors.blue)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(),

            /// 加载网络图片
            Text('network网络图片'),
            Divider(),
            Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                height: 200,
                width: 200),
            Divider(),

            /// 加载网络图片
            Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4")),

            Divider(),
            Text('centerSlice图片内部拉伸'),
            Divider(),
            Image.asset('assets/images/flutter_logo.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                centerSlice:
                Rect.fromCircle(center: const Offset(20, 20), radius: 1)),

            Divider(),
            Text('matchTextDirection图片内部方向'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          height: 150,
                          matchTextDirection: true,
                          fit: BoxFit.cover)),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          height: 150,
                          matchTextDirection: true,
                          fit: BoxFit.cover))
                ]),
            Divider()
          ]),
        ));
  }
}
