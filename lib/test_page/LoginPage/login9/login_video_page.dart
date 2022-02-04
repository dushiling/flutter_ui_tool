import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';

import 'package:video_player/video_player.dart';


class LoginVideoPage extends StatefulWidget {
  LoginVideoPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginVideoPageState();
}

class _LoginVideoPageState extends State<LoginVideoPage> {
  /// 声明视频控制器
  late VideoPlayerController _controller;

  /// 视频地址
  final String videoUrl =
      "https://video.pearvideo.com/mp4/third/20190730/cont-1584187-10136163-164150-hd.mp4";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Transform.scale(
            scale: _controller.value.aspectRatio /
                MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Text("正在初始化"),
              ),
            ),
          ),
          Positioned(
            bottom: 26.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                  width: 200,
                  child: Text("微信登录", style: TextStyle(fontSize: 18)),
                  borderRadius: 60,
                  onPressed: () {},
                  color: Color(0xffFFDB2E),
                  textColor: Color(0xff202326),
                  height: 44.0,
                ),
                SizedBox(height: 20),
                Button(
                  width: 200,
                  child: Text("手机号登录", style: TextStyle(fontSize: 18)),
                  borderRadius: 60,
                  onPressed: () {},
                  color: Color(0xff202326),
                  textColor: Color(0xffededed),
                  height: 44.0,
                ),
                SizedBox(height: 40),
                Text(
                  "我已阅读并同意《服务协议》及《隐私政策》",
                  style: TextStyles.textWhite28,
                )
              ],
            ),
          ),
          Positioned(
            top: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "登录",
                  style: TextStyles.textBoldWhile80,
                ),
                SizedBox(height: 10),
                Text(
                  "视频背景登录页面",
                  style: TextStyles.textWhite32,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
