import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';


import 'background.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool eye = true;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.deepOrangeAccent, Colors.purple],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 70.0));

  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: CustomPaint(
              painter: Background(),
              size: Size(SizeUtil.width, SizeUtil.height),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: SizeUtil.navigationBarHeight),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "登录",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()..shader = linearGradient),
                  ),
                  SizedBox(height: 60),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      // hintText: "Email",
                      labelText: "邮箱",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "密码",
                      suffixIcon: GestureDetector(
                        child: Icon(
                          eye ? Icons.visibility_off : Icons.visibility,
                        ),
                        onTap: _toggle,
                      ),
                    ),
                    obscureText: eye,
                  ),
                  SizedBox(height: 20),
                  Button(
                    child: Text('登录',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    color: Colors.black,
                    borderRadius: 30,
                    disabledColor: Colors.white54,
                    onPressed: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: Text(
                      "Or sign in with social account",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Button(
                          child:
                              Text('FaceBook', style: TextStyle(fontSize: 18)),
                          icon: FontAwesome.facebook,
                          buttonShape: ButtonShape.OUTLINE,
                          halfRadius: true,
                          textColor: Colors.black,
                          highlightedBorderColor: Colors.black,
                          borderColor: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Button(
                        child: Text('Twitter', style: TextStyle(fontSize: 18)),
                        icon: FontAwesome.twitter,
                        buttonShape: ButtonShape.OUTLINE,
                        halfRadius: true,
                        textColor: Colors.black,
                        highlightedBorderColor: Colors.black,
                        borderColor: Colors.black,
                        onPressed: () {},
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeUtil.navigationBarHeight,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: FlatButton(
                    child: Text(
                      "注册",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    highlightColor: Colors.black26,
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
