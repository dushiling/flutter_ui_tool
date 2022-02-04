import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
import 'package:flutter_ui_tool/widgets/input_view.dart';

/// 参考：https://github.com/pedromassango/my_flutter_challenges/blob/master/lib/sliding_login.dart
class SlidingLoginPage extends StatefulWidget {
  SlidingLoginPage({Key? key}) : super(key: key);

  @override
  createState() => _SlidingLoginPageState();
}

class _SlidingLoginPageState extends State<SlidingLoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;

  late AnimationController _controller;

  late Animation<double> _marginAnimation;

  late Animation<Offset> _slideAnimation;

  late Animation<double> _opacityAnimation;

  double _defaultMargin = SizeUtil.height / 2.5;

  Duration animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: animationDuration);

    CurvedAnimation animation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    _marginAnimation =
        Tween<double>(begin: _defaultMargin, end: 0).animate(animation);

    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.0))
        .animate(animation);

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildLoginComponents(),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Offstage(
                      offstage: isLogin,
                      child: _buildRegisterComponents(),
                    ),
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: !isLogin,
              child: Container(
                alignment: Alignment.center,
                height: SizeUtil.height - SizeUtil.width / 2 - _defaultMargin,
                child: GestureDetector(
                  onTap: () {
                    _controller.forward();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    '注册'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF2a3ed7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginComponents() {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            margin: EdgeInsets.only(top: _marginAnimation.value),
            width: double.infinity,
            height: SizeUtil.width / 2,
            decoration: BoxDecoration(
              color: Color(0xFF2A3ED7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeUtil.width / 2),
                bottomRight: Radius.circular(SizeUtil.width / 2),
              ),
            ),
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: InkWell(
                onTap: isLogin
                    ? null
                    : () {
                        _controller.reverse();

                        setState(() => isLogin = !isLogin);
                      },
                child: Text(
                  '登录'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            color: Color(0xFF2A3ED7),
            padding: EdgeInsets.only(top: 80, left: 42, right: 42),
            width: double.infinity,
            height: _defaultMargin,
            child: Column(
              children: <Widget>[
                TextFieldView(
                  margin: EdgeInsets.zero,
                  icon: Icons.email,
                  hintText: '邮箱',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: Border.all(color: Color(0xffffffff), width: 0.5),
                ),
                TextFieldView(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  icon: Icons.vpn_key,
                  hintText: '密码',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: Border.all(color: Color(0xffffffff), width: 0.5),
                ),
                Button(
                  onPressed: () {
                    TostUtil.showToast('登录');
                  },
                  child: Text('登录'.toUpperCase(),
                      style: TextStyle(fontSize: 18)),
                  color: Colors.white,
                  textColor: Colors.black,
                    halfRadius: true
                  // halfRadius: true,
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterComponents() {
    return Padding(
      padding: EdgeInsets.only(left: 42, right: 42, bottom: 20),
      child: Column(
        children: <Widget>[
          Text(
            '注册'.toUpperCase(),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0XFF2a3ed7),
            ),
          ),
          SizedBox(height: 40),
          TextFieldView(
            style: TextStyle(color: Colors.black),
            icon: Icons.email,
            hintText: '邮箱',
            margin: EdgeInsets.zero,
          ),
          SizedBox(height: 16),
          TextFieldView(
            style: TextStyle(color: Colors.black),
            icon: Icons.vpn_key,
            hintText: '密码',
            margin: EdgeInsets.zero,
          ),
          SizedBox(height: 16),
          TextFieldView(
            margin: EdgeInsets.zero,
            style: TextStyle(color: Colors.black),
            hintText: '确认密码',
            icon: Icons.vpn_key,
          ),
          SizedBox(height: 16),
          Button(
            onPressed: () {
              TostUtil.showToast('注册');
            },
            child: Text('注册'.toUpperCase(),
                style: TextStyle(fontSize: 18)),
            textColor: Colors.white,
            color: Color(0xFF2A3ED7),
              halfRadius: true
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
