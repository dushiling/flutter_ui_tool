import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
import 'package:flutter_ui_tool/widgets/input_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
import 'package:sp_util/sp_util.dart';
import 'package:get/get.dart';

import 'quickly_login_page.dart';
import 'register_page.dart';
import 'reset_password_page.dart';

class PasswordLoginPage extends StatefulWidget {
  PasswordLoginPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<PasswordLoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FocusNode _nodePhone = FocusNode();
  final FocusNode _nodePassword = FocusNode();

  bool _isClick = false;

  @override
  void initState() {
    super.initState();

    /// 监听输入改变
    _phoneController.addListener(_verify);
    _passwordController.addListener(_verify);

    setState(() => _phoneController.text = SpUtil.getString('login_phone')!);
  }

  void _verify() {
    String name = _phoneController.text;
    String password = _passwordController.text;
    if (name.isEmpty || name.length < 11) {
      setState(() {
        _isClick = false;
      });
      return;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        _isClick = false;
      });
      return;
    }

    setState(() {
      _isClick = true;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SLAppBarWidget(title:'',leadingWidget: CloseButton(),backgroundColor: Theme.of(context).scaffoldBackgroundColor ,actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: FlatButton(
              child: Text(
                "快速登录",
                style: TextStyles.textDark28,
              ),
              onPressed: () => Get.to(QuicklyLoginPage()),
              highlightColor: Colors.black26,
              shape: StadiumBorder(),
            ),
          )
        ]),
        body: SingleChildScrollView(child: _buildBodyView()));
  }

  Widget _buildBodyView() {
    return Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('密码登录',
                  style: TextStyles.textBoldDark52),
             SizedBox(height: 16),
              CustomTextField(
                  focusNode: _nodePhone,
                  controller: _phoneController,
                  maxLength: 11,
                  nextFocusNode: _nodePassword,
                  keyboardType: TextInputType.phone,
                  hintText: "请输入账号"),
              SizedBox(height: 10),
              CustomTextField(
                  focusNode: _nodePassword,
                  isInputPwd: true,
                  controller: _passwordController,
                  maxLength: 16,
                  hintText:  "请输入密码"),
              SizedBox(height: 25),
              Button(
                  onPressed: _isClick ? _login : null,
                  child: Text('登录',
                      style: TextStyle(fontSize: 18)),
                  borderRadius: 0),
              SizedBox(height: 16),
              Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      child: Padding(
                          child: Text('忘记密码',
                              style: TextStyles.textGrey28),
                          padding: EdgeInsets.all(10)),
                      onTap: () =>  Get.to(ResetPasswordPage()))),
              SizedBox(height: 16),
              Container(
                  alignment: Alignment.center,
                  child: InkWell(
                      child: Padding(
                          child: Text('还没账号？快去注册',
                              style: TextStyles.textBlue32),
                          padding: EdgeInsets.all(10)),
                      onTap: () => Get.to(RegisterPage())))
            ]));
  }

  void _login() async {
    SpUtil.putString('login_phone', _phoneController.text);

    Navigator.pop(context);
  }
}
