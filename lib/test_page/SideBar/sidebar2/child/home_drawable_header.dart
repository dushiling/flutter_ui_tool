import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/data.dart';


class HomeDrawableHeader extends StatelessWidget {
  HomeDrawableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(

      /// 姓名
        accountName: Text('杜杜'),

        /// 邮箱
        accountEmail: Text('1197467923@qq.com'),

        /// 用户头像
        currentAccountPicture: InkWell(
            child: Hero(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                  child: Image.asset('assets/images/sidebar1/userImage.png'),
                ),
                tag: 'user_avatar'),
            onTap: () {

            }),
        otherAccountsPictures: <Widget>[
          GestureDetector(
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://wx1.sinaimg.cn/bmiddle/0060lm7Tgy1g2qrft0upcj30u01hcwpa.jpg")),
              onTap: () {}),
          GestureDetector(
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://wx1.sinaimg.cn/bmiddle/0060lm7Tgy1g2qrf51edvj30u01hbgse.jpg")),
              onTap: () {})
        ],

        /// 装饰器 header区域的decoration，通常用来设置背景颜色或者背景图片
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.2), BlendMode.multiply),
              image: NetworkImage(backgroundImage),
              fit: BoxFit.cover),
        ));
  }
}
