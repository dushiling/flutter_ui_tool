import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_tool/config/app_config.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/input_view.dart';
class TextFidldTextPage extends StatefulWidget {
  const TextFidldTextPage({Key? key}) : super(key: key);

  @override
  _TextFidldTextPageState createState() => _TextFidldTextPageState();
}

class _TextFidldTextPageState extends State<TextFidldTextPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  final FocusNode _nodePhone = FocusNode();
  final FocusNode _nodePassword = FocusNode();
  final FocusNode _nodeVCode = FocusNode();


  TimerUtil timerUtil = new TimerUtil(mInterval: 1000,mTotalTime: 6*1000);

  bool eye = true;
  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('测试页面-TextFidld')),
       backgroundColor: Colors.white,
       body: Padding(
         padding: EdgeInsets.all(10),
         child: ListView(
           children: [
             descTitle('登录输入框'),
             CustomTextField(
                 controller: _phoneController,
                 maxLength: 11,
                 prefixIcon: Padding(child: Image.asset(
                  'assets/images/account_icon.png', width: 34.w,
                   height: 38.w,), padding:  EdgeInsets.only(right: 15,top: 15,bottom: 15)),
                 hintText: "请输入手机号或邮箱"),
             SizedBox(height: 10),
             CustomTextField(
                 isInputPwd: true,
                 controller: _passwordController,
                 maxLength: 20,
                 prefixIcon: Padding(child: Image.asset(
                   'assets/images/password_icon.png', width: 34.w,
                   height: 38.w,), padding: EdgeInsets.only(right: 15,top: 15,bottom: 15)),
                 hintText: "请输入密码"),

             descTitle('注册输入框'),
             CustomTextField(
               controller: _phoneController,
               maxLength: 11,
               hintText: "请输入手机号",
               keyboardType: TextInputType.number,
               prefixIcon: InkWell(
                 onTap: () {
                    TostUtil.showToast('去选择国家');
                 },
                 child:Container(
                   width: 172.w,
                   child: Row(
                     children: [
                       Text('  +86'),
                       SizedBox(width: 10),
                       Image.asset( 'assets/images/rightRow.png',
                           width: 14.w, height: 24.h),
                       SizedBox(width: 18),
                       Divider(height: 46.h,
                           color: ColorsV.deviderLineColor),
                     ],
                   ),),
               ),
             ),
             CustomTextField(
                 controller: _vCodeController,
                 maxLength: 6,
                 keyboardType: TextInputType.number,
                 hintText: "请输入验证码",
                 timerUtil: timerUtil,
                 getVCode: () {
                   TostUtil.showToast('获取验证码成功');
                   timerUtil.startCountDown();
                 }),
             CustomTextField(
               isInputPwd: true,
               controller: _passwordController,
               maxLength: 20,
               hintText: "请输入密码(6-20位包含数字和字母)",
               regExpStr: AppConfig.passwordRegExpStr,
             ),
             CustomTextField(
               isInputPwd: true,
               controller: _repasswordController,
               maxLength: 20,
               hintText: "请确认密码",
               regExpStr: AppConfig.passwordRegExpStr,
             ),

             descTitle('普通输入框'),
             CustomTextField(
                 focusNode: _nodePhone,
                 controller: _phoneController,
                 maxLength: 11,
                 nextFocusNode: _nodePassword,
                 keyboardType: TextInputType.phone,
                 hintText: "请输入账号"),
             SizedBox(height: 10,),
             CustomTextField(
                 focusNode: _nodePassword,
                 isInputPwd: true,
                 controller: _passwordController,
                 maxLength: 16,
                 hintText: "请输入密码"),


             descTitle('图标在里圆角输入框'),
             TextFieldView(
               margin: EdgeInsets.zero,
               icon: Icons.email,
               hintText: '邮箱',
               hintStyle: TextStyle(color: Colors.grey),
               border: Border.all(color: Color(0xffffffff), width: 0.5),
                // bgColor: Colors.orange,
             ),
             TextFieldView(
               margin: EdgeInsets.symmetric(vertical: 16),
               icon: Icons.vpn_key,
               hintText: '密码',
               hintStyle: TextStyle(color: Colors.grey),
               border: Border.all(color: Color(0xffffffff), width: 0.5),
               // bgColor: Colors.orange,
             ),

             descTitle('标题上移输入框'),
             TextField(
               keyboardType: TextInputType.emailAddress,
               autocorrect: false,
               decoration: InputDecoration(
                 // hintText: "Email",
                 labelText: "邮箱",
               ),
             ),
             SizedBox(height: 10,),
             TextField(
               keyboardType: TextInputType.text,
               autocorrect: false,
               decoration: InputDecoration(
                 // hintText: "Email",
                 labelText: "用户名",
               ),
             ),
             SizedBox(height: 10,),
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

             descTitle('图标在里居左无边框输入框'),
             CTextField(
                 icon: Icons.email,
                 hintText: "邮箱",
                 controller: _phoneController),
             SizedBox(height: 10,),
             CTextField(
                 icon: Icons.lock,
                 hintText: "密码",
                 controller: _passwordController,
                 obscure: true),
             descTitle('图标在里居右无边框输入框'),
             TextFormField(
                 style: Theme.of(context).textTheme.headline6!
                     .copyWith(color: Colors.black87, letterSpacing: 1.2),
                 decoration: InputDecoration(
                     hintText: '邮箱',
                     hintStyle: Theme.of(context).textTheme.subtitle1!
                         .copyWith(color: Colors.black.withOpacity(0.6)),
                     suffixIcon: Icon(Icons.email, color: Colors.grey)),
                 keyboardType: TextInputType.emailAddress,
                 controller: _phoneController,
                 validator: (val) => val!.isEmpty
                     ? '邮箱不能为空'
                     : val.length < 10
                     ? '邮箱不合法'
                     : null),

             descTitle('图标在里圆角输入框2'),
             CustomTF(
               title: "Email",
               hintText: "Enter your Email",
               icon: Icons.email,
               keyboardType: TextInputType.emailAddress,
               controller: _phoneController,
             ),
             SizedBox(height: 1.0),
             CustomTF(
               title: "Password",
               hintText: "Enter your Password",
               icon: Icons.lock,
               obscure: true,
               keyboardType: TextInputType.visiblePassword,
               controller: _passwordController,
             ),

           ],
         ),
       ),
    );
  }

  Widget descTitle(String title){
    return Column(
      children: [
        SizedBox(height: 40,),
        Text(title,style: TextStyle(color: Colors.red),),
        SizedBox(height: 10,),
      ],
    );
  }
}
