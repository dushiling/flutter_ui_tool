import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
import 'package:flutter_ui_tool/widgets/input_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
import 'package:sp_util/sp_util.dart';
import 'register_page.dart';
import 'reset_password_page.dart';
import 'package:get/get.dart';

class QuicklyLoginPage extends StatefulWidget {
  QuicklyLoginPage({Key? key}) : super(key: key);

  @override
  createState() => _QuicklyLoginPageState();
}

class _QuicklyLoginPageState extends State<QuicklyLoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();

  final FocusNode _nodePhone = FocusNode();
  final FocusNode _nodeVCode = FocusNode();

  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_verify);
    _vCodeController.addListener(_verify);

    setState(() => _phoneController.text = SpUtil.getString('login_phone')!);
  }

  void _verify() {
    String name = _phoneController.text;
    String vCode = _vCodeController.text;
    if (name.isEmpty || name.length < 11) {
      setState(() => _isClick = false);
      return;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      setState(() => _isClick = false);
      return;
    }

    setState(() => _isClick = true);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _vCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SLAppBarWidget(title:'',leadingWidget: CloseButton(),backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        body: SingleChildScrollView(
            padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("快速登录",
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
                      controller: _vCodeController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      hintText: "请输入验证码",
                      getVCode: () {
                        TostUtil.showToast('获取验证码');
                      }),
                  SizedBox(height: 10),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: '提示：未注册账号的手机号，请先',
                              style: TextStyles.textGrey28,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '注册',
                                  style: TextStyle(color: Colors.redAccent),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Get.to(RegisterPage()),
                                ),
                                TextSpan(text: '。')
                              ]))),
                  SizedBox(height: 25),
                  Button(
                    borderRadius: 0,
                    onPressed: _isClick ? _login : null,
                    child: Text('登录',
                        style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 10),
                  Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          child: Padding(
                              child: Text('忘记密码',
                                  style: TextStyles.textGrey28),
                              padding: EdgeInsets.all(10)),
                          onTap: () =>
                              Get.to(ResetPasswordPage())))
                ])));
  }

  void _login() async {
    SpUtil.putString('login_phone', _phoneController.text);

    Navigator.pop(context);
  }
}
