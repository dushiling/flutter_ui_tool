import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_tool/page/tab_page.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;


  // 初始化状态
  @override
  void initState() {
    super.initState();

    // 两个参数 垂直动态演示  和显示的秒数
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _animation = Tween(begin: 1.0, end: 1.0).animate(_animationController);
    /*动画事件监听器，
    它可以监听到动画的执行状态，
    这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status) async {
      // 判断动画是否结束
      if (status == AnimationStatus.completed) {

        Get.offAll(() => TabPage());

      }
    });
    // 进入页面播放动画
    _animationController.forward();
  }

  // 销毁控制器
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 动画透明的控件
    return Scaffold(
       body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Positioned(
                  bottom: 124.h,
                  child: Text(
                      "welcome".tr,
                      style: TextStyles.TS_B1B1B1_30sp
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
