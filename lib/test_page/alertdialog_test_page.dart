import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/alert_dialog_util.dart';
import 'package:flutter_ui_tool/widgets/button.dart';


class AlertDialogTestPage extends StatefulWidget {
  const AlertDialogTestPage({Key? key}) : super(key: key);

  @override
  _AlertDialogTestPageState createState() => _AlertDialogTestPageState();
}

class _AlertDialogTestPageState extends State<AlertDialogTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('测试页面-AlertDialog')),
      body: Wrap(
        children: [
          Text('AlertDialog:'),
         BtnW('showMessageDialog', () {
           AlertDialogUtil.showMessageDialog(context);
         }),
         BtnW('showMessageDialog1', () {
           AlertDialogUtil.showMessageDialog1(context);
         }),
         BtnW('showMessageDialog2', () {
           AlertDialogUtil.showMessageDialog2(context);
         }),
         BtnW('showMessageDialog3', () {
           AlertDialogUtil.showMessageDialog3(context,
             contentWidget: Container(
               padding: EdgeInsets.all(20),
               child: Column(
                 children: [
                   RichText(text: TextSpan(
                       children: [
                         TextSpan(text: "曾经沧海难为水，除却巫山不是云\n", style: TextStyle(
                             color: Colors.red
                         )),
                         TextSpan(text: "取次花丛懒回顾，半缘修道半缘君", style: TextStyle(
                             color: Colors.black
                         )),
                         TextSpan(text: "取次花丛懒回顾，半缘修道半缘君", style: TextStyle(
                             color: Colors.black
                         ))
                       ]
                   )),
                 ],
               ),
             ));
         }),
          BtnW('showMessageDialog4', () {
            AlertDialogUtil.showMessageDialog4(context);
          }),
         BtnW('showDialogAbout', () {
           AlertDialogUtil.showDialogAbout(context);
         }),
         BtnW('showCustomeDialog', () {
           AlertDialogUtil.showCustomeDialog(context);
         }),
         BtnW('showActionSheetDialog', () {
           AlertDialogUtil.showActionSheetDialog(context);
         }),
         BtnW('showBottomDialog', () {
           AlertDialogUtil.showBottomDialog(context);
         }),
          BtnW('showProgressDialog', () {
            AlertDialogUtil.showProgressDialog(context);
          }),
          BtnW('showGifDialog', () {
            AlertDialogUtil.showGifDialog(context,
              image: Image.network(
                "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                fit: BoxFit.cover,
              ),
              title: Text(
                'Men Wearing Jackets',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              description: Text(
                'This is a men wearing jackets dialog box. This library helps you easily create fancy giffy dialog.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              onOkButtonPressed: () {},);
          }),
          BtnW('showCupertinoAlert', () {
            AlertDialogUtil.showCupertinoAlert(context,okOnTap: (){
              print('点了确定');
            });
          }),
          BtnW('showCupertinoAlertWithButtons', () {
            AlertDialogUtil.showCupertinoAlertWithButtons(context,buttonList: ['选项1','选项2','选项3','选项4','Cancel'],onTapV: (index){
              print('点击了第$index个');
            });
          }),
          BtnW('showCupertinoActionSheet', () {
            AlertDialogUtil.showCupertinoActionSheet(context,buttonList: ['相机','从相册中选择'],onTapV: (index){
              print('选择了第$index个');
            });
          }),
          BtnW('showCupertinoActionSheetWithCancel', () {
            AlertDialogUtil.showCupertinoActionSheetWithCancel(context);
          }),
          BtnW('showSnackBar', () {
            AlertDialogUtil.showSnackBar(context,title: '测试',actionString: '知道了');
          }),


        ],
      ),
    );
  }

  Widget BtnW(String title,VoidCallback click){
    return  TextButton(onPressed: click, child: Text(title));
  }

}
