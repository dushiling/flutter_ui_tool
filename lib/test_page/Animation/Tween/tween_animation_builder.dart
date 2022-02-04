import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterAnimationWidget extends StatefulWidget {
  @override
  _FlutterAnimationWidgetState createState() => _FlutterAnimationWidgetState();
}

class _FlutterAnimationWidgetState extends State<FlutterAnimationWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween<double>(begin: 0, end: 50).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _colorAnimation = ColorTween(begin: Colors.orangeAccent, end: Colors.redAccent).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) print("动画完成");
    });
  }

  void startEasyAnimation() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 50,
              color: _colorAnimation.value,
              margin: EdgeInsets.only(top: _animation.value),
            ),
            FlatButton(
              onPressed: startEasyAnimation,
              child: Text(
                "点击执行最简单动画",
                style: TextStyle(color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}