import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
import 'package:flutter_ui_tool/widgets/flutter_flip_view.dart';
import 'package:flutter_ui_tool/widgets/gradual_change_view.dart';


class FlipLoginPage extends StatefulWidget {
  FlipLoginPage({Key? key}) : super(key: key);

  @override
  createState() => _FlipLoginPageState();
}

class _FlipLoginPageState extends State<FlipLoginPage>
    with SingleTickerProviderStateMixin {
  late LoginMode mode;

  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;

  late TextEditingController userController;
  late TextEditingController pwdController;
  late TextEditingController pwdAgainController;
  late FocusNode pwdFocus;
  late FocusNode pwdAgainFocus;

  @override
  void initState() {
    super.initState();

    userController = TextEditingController();
    pwdController = TextEditingController();
    pwdAgainController = TextEditingController();
    pwdFocus = FocusNode();
    pwdAgainFocus = FocusNode();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    userController.dispose();
    pwdController.dispose();
    pwdAgainController.dispose();
    super.dispose();
  }

  void _flip(bool reverse) {
    if (_animationController.isAnimating) return;
    if (reverse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        AspectRatio(
            aspectRatio: 1.5,
            child: GradualChangeView(
                colors: [Color(0xFFfbab66), Color(0xFFf7418c)],
                child: ClipOval(child: Image.asset('assets/images/flutter_logo.png',
                    width: 80, height: 80,fit: BoxFit.fill,),),
                alignment: Alignment.center)),
        Center(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: FlipView(
                    animationController: _curvedAnimation,
                    front: _buildLoginView(),
                    back: _buildRegisterView())))
      ]),
    );
  }

  Widget _buildLoginView() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: ShapeDecoration(
        color: ColorsV.primaryColor,
        shadows: [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            blurRadius: 9,
            spreadRadius: 3,
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
            topRight: Radius.elliptical(25, 25),
            bottomLeft: Radius.elliptical(25, 25),
          ),
        ),
      ),
      height: 240,
      child: Column(
        children: <Widget>[
          _buildFormView(LoginMode.LOGIN),
          Button(
            width: 110,
            onPressed: () {
              _flip(true);
            },
            child:
            Text('登录', style: TextStyle(fontSize: 18)),
            textColor: Colors.lightBlue,
            color: Colors.white,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      width: double.infinity,
    );
  }

  Widget _buildRegisterView() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: ShapeDecoration(
        color: Colors.green,
        shadows: [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            blurRadius: 9,
            spreadRadius: 3,
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
            topRight: Radius.elliptical(25, 25),
            bottomLeft: Radius.elliptical(25, 25),
          ),
        ),
      ),
      height: 290,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _buildFormView(LoginMode.REGIST),
          Button(
            width: 110,
            onPressed: () {
              _flip(false);
            },
            buttonShape: ButtonShape.OUTLINE,
            child: Text('注册',
                style: TextStyle(fontSize: 18)),
            textColor: Colors.white,
            color: Colors.transparent,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Widget _buildFormView(LoginMode mode) {
    return Column(
      children: <Widget>[
        /// 用户名
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.account_circle, color: Colors.white),
            ),
            Expanded(
              child: TextField(
                onSubmitted: (String str) {
                  FocusScope.of(context).requestFocus(pwdFocus);
                },
                textInputAction: TextInputAction.next,
                controller: userController,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText: '用户名',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
                  contentPadding: EdgeInsets.only(top: 10, bottom: 4),
                ),
              ),
            )
          ],
        ),
       SizedBox(height: 15),

        /// 密码
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.lock, color: Colors.white),
            ),
            Expanded(
              child: TextField(
                onSubmitted: (String str) {
                  if (mode == LoginMode.REGIST) {
                    FocusScope.of(context).requestFocus(pwdAgainFocus);
                  }
                },
                textInputAction: mode == LoginMode.LOGIN
                    ? TextInputAction.done
                    : TextInputAction.next,
                focusNode: pwdFocus,
                controller: pwdController,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText: '密码',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
                  contentPadding: EdgeInsets.only(top: 10, bottom: 4),
                ),
              ),
            )
          ],
        ),

        /// 确认密码
        Offstage(
          offstage: mode != LoginMode.REGIST,
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.lock, color: Colors.white),
                ),
                Expanded(
                  child: TextField(
                    focusNode: pwdAgainFocus,
                    controller: pwdAgainController,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '确认密码',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
                      contentPadding: EdgeInsets.only(top: 10, bottom: 4),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
