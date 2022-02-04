import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
import 'package:flutter_ui_tool/widgets/input_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';


class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  @override
  createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  /// 定义一个controller
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FocusNode _nodePhone = FocusNode();
  final FocusNode _nodeVCode = FocusNode();
  final FocusNode _nodePassword = FocusNode();

  bool _isClick = false;

  @override
  void initState() {
    super.initState();

    /// 监听输入改变
    _phoneController.addListener(_verify);
    _vCodeController.addListener(_verify);
    _passwordController.addListener(_verify);
  }

  void _verify() {
    String name = _phoneController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    if (name.isEmpty || name.length < 11) {
      setState(() {
        _isClick = false;
      });
      return;
    }
    if (vCode.isEmpty || vCode.length < 6) {
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
    _vCodeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SLAppBarWidget(title:'',backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        body: SingleChildScrollView(
            padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("重置登录密码",
                      style: TextStyles.textBoldDark52),
                  SizedBox(height: 16),
                  CustomTextField(
                      focusNode: _nodePhone,
                      nextFocusNode: _nodeVCode,
                      controller: _phoneController,
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      hintText: "请输入账号"),
                  SizedBox(height: 10),
                  CustomTextField(
                      focusNode: _nodeVCode,
                      nextFocusNode: _nodePassword,
                      controller: _vCodeController,
                      keyboardType: TextInputType.number,
                      getVCode: () {},
                      maxLength: 6,
                      hintText: "请输入验证码"),
                  SizedBox(height: 10),
                  CustomTextField(
                      focusNode: _nodePassword,
                      isInputPwd: true,
                      controller: _passwordController,
                      maxLength: 16,
                      hintText: "请输入密码"),
                  SizedBox(height: 25),
                  Button(
                    borderRadius: 0,
                    onPressed: _isClick ? _reset : null,
                    child: Text('提交',
                        style: TextStyle(fontSize: 18)),
                  )
                ])));
  }

  void _reset() {}
}
