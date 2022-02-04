import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_ui_tool/utils/utils.dart';

//Alert
//******************************************************//
/// 标题配置类
class TitleConfig {
  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)
  final TextStyle style;

  /// 文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 20, 15, 0)
  final EdgeInsetsGeometry padding;

  const TitleConfig(
      {this.style = const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      this.textAlign = TextAlign.center,
      this.padding = const EdgeInsets.fromLTRB(15, 20, 15, 0)});
}

/// 信息配置类
class MessageConfig {
  /// 信息文本样式，默认为：const TextStyle(fontSize: 13, color: Colors.black)
  final TextStyle style;

  /// 信息文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 10, 15, 20)
  final EdgeInsetsGeometry padding;

  const MessageConfig(
      {this.style = const TextStyle(fontSize: 13, color: Colors.black),
      this.textAlign = TextAlign.center,
      this.padding = const EdgeInsets.fromLTRB(15, 10, 15, 20)});
}

/// 取消按钮配置类
class CancelConfig {
  /// 文本数据，默认为："取消"
  final String data;

  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black),
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback? onTapCancel;

  /// 自定义 cancel
  final Widget? cancel;

  const CancelConfig({
    this.data = "取消",
    this.style = const TextStyle(fontSize: 16, color: Colors.black),
    this.onTapCancel,
    this.cancel,
  });
}

/// 确认按钮配置类
class ConfirmConfig {
  /// 文本数据，默认为："确定"
  final String data;

  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black)
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback? onTapConfirm;

  /// 自定义 confirm
  final Widget? confirm;

  const ConfirmConfig(
      {this.data = "确定",
      this.style = const TextStyle(fontSize: 16, color: Colors.black),
      this.onTapConfirm,
      this.confirm});
}

class Alert extends StatefulWidget {
  // const Alert({Key? key}) : super(key: key);
  /// 标题
  final String? title;

  /// 标题配置类
  final TitleConfig titleConfig;

  /// 信息
  final String message;

  /// 信息配置类
  final MessageConfig messageConfig;

  /// 内容
  final Widget? content;

  /// 取消按钮配置类
  final CancelConfig? cancelConfig;

  /// 确定按钮配置类
  final ConfirmConfig? confirmConfig;

  /// 按钮高度，默认为：45.0
  final double buttonHeight;

  /// 颜色
  final Color color;

  /// 圆角大小，默认为：10.0
  final double radius;

  /// 分割线颜色，默认为：Color(0xffeeeeee)
  final Color dividerColor;

  const Alert({
    Key? key,
    this.title,
    this.titleConfig = const TitleConfig(),
     this.message = "",
    this.messageConfig = const MessageConfig(),
    this.content,
    this.cancelConfig,
    this.confirmConfig,
    this.buttonHeight = 45,
    this.color = Colors.white,
    this.radius = 10.0,
    this.dividerColor = const Color(0xffeeeeee),
  });
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  bool _cancelClick = false;
  bool _confirmClick = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _lrSpacing = _screenWidth * 0.16;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _lrSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius),
                ),
              ),
            ),
            child: Column(
              children: [
                // 标题内容
                if (widget.title != null) titleContent(),

                // content
                if (widget.content != null) widget.content!,
                if (widget.content == null) messageContent(),

                // 按钮
                if (widget.cancelConfig != null || widget.confirmConfig != null)
                  btnContent(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 标题
  Widget titleContent() {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: widget.titleConfig.padding,
      child: Text(
        widget.title!,
        style: widget.titleConfig.style,
        textAlign: widget.titleConfig.textAlign,
      ),
    );
  }

  /// 信息
  Widget messageContent() {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: widget.messageConfig.padding,
      child: Text(
        widget.message,
        style: widget.messageConfig.style,
        textAlign: widget.messageConfig.textAlign,
      ),
    );
  }

  /// 按钮
  Widget btnContent(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: widget.dividerColor,
            width: double.infinity,
            height: 1,
          ),
          Container(
            width: double.infinity,
            color: Colors.transparent,
            height: widget.buttonHeight,
            child: Row(
              children: [
                if (widget.cancelConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.cancelConfig!.cancel == null) {
                          Navigator.pop(context);
                          if (widget.cancelConfig!.onTapCancel != null) {
                            widget.cancelConfig!.onTapCancel!();
                          }
                        }
                      },
                      onTapDown: (details) {
                        if (widget.cancelConfig!.cancel == null) {
                          setState(() {
                            _cancelClick = true;
                          });
                        }
                      },
                      onTapCancel: () {
                        if (widget.cancelConfig!.cancel == null) {
                          setState(() {
                            _cancelClick = false;
                          });
                        }
                      },
                      child: Container(
                        color: _cancelClick == true
                            ? Colors.black12.withOpacity(0.07)
                            : Colors.transparent,
                        alignment: Alignment.center,
                        height: widget.buttonHeight,
                        child: widget.cancelConfig!.cancel != null
                            ? widget.cancelConfig!.cancel
                            : Text(
                                widget.cancelConfig!.data,
                                style: widget.cancelConfig!.style,
                              ),
                      ),
                    ),
                  ),
                if (widget.cancelConfig != null && widget.confirmConfig != null)
                  Container(
                    color: widget.dividerColor,
                    width: 1,
                    height: widget.buttonHeight,
                  ),
                if (widget.confirmConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.confirmConfig!.confirm == null) {
                          Navigator.pop(context);
                          if (widget.confirmConfig!.onTapConfirm != null) {
                            widget.confirmConfig!.onTapConfirm!();
                          }
                        }
                      },
                      onTapDown: (details) {
                        if (widget.confirmConfig!.confirm == null) {
                          setState(() {
                            _confirmClick = true;
                          });
                        }
                      },
                      onTapCancel: () {
                        if (widget.confirmConfig!.confirm == null) {
                          setState(() {
                            _confirmClick = false;
                          });
                        }
                      },
                      child: Container(
                        color: _confirmClick == true
                            ? Colors.black12.withOpacity(0.07)
                            : Colors.transparent,
                        alignment: Alignment.center,
                        height: widget.buttonHeight,
                        child: widget.confirmConfig!.confirm != null
                            ? widget.confirmConfig!.confirm
                            : Text(
                                widget.confirmConfig!.data,
                                style: widget.confirmConfig!.style,
                              ),
                      ),
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
//******************************************************//

//ActionSheet
//******************************************************//
typedef ActionSheetCallback = Function(int);

class ActionSheetConfig {
  /// 提示信息
  final String? message;

  /// 提示信息的 TextStyle
  final TextStyle? messageStyle;

  /// 其他标题数据
  final List? data;

  /// 其他标题的 TextStyle
  final TextStyle? style;

  /// 取消标题的 TextStyle
  final TextStyle? cancelStyle;

  /// 分割线高度，默认为：0.5
  final double dividerHeight;

  /// 分割线颜色，默认为：Colors.black12
  final Color dividerColor;

  /// 其他标题的点击回调方法
  final ActionSheetCallback? onTap;

  ActionSheetConfig(
      {this.message = "",
      this.messageStyle,
      this.data,
      this.style,
      this.cancelStyle,
      this.dividerHeight = 0.5,
      this.dividerColor = Colors.black12,
      this.onTap})
      : assert(
          data != null,
        );
}

class ActionSheet {
  /// 显示 ActionSheet
  static show({required BuildContext context, ActionSheetConfig? config}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (content) {
          return SafeArea(
              child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Offstage(
                  offstage: config!.message == "" ? true : false,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          config.message ?? '',
                          textAlign: TextAlign.center,
                          style: config.messageStyle,
                        ),
                        SizedBox(height: 20),
                        Divider(
                          height: config.dividerHeight,
                          thickness: config.dividerHeight,
                          color: config.dividerColor,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(config.data!.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            config.data![index],
                            textAlign: TextAlign.center,
                            style: config.style,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            if (config.onTap != null) {
                              config.onTap!(index);
                            }
                          },
                        ),
                        if (index != config.data!.length - 1)
                          Divider(
                            height: config.dividerHeight,
                            thickness: config.dividerHeight,
                            color: config.dividerColor,
                          )
                      ],
                    );
                  }),
                ),
                Divider(
                  height: 7,
                  thickness: 7,
                  color: Colors.grey.withOpacity(0.17),
                ),
                ListTile(
                  title: Text(
                    "取消",
                    textAlign: TextAlign.center,
                    style: config.cancelStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ));
        });
  }
}



//******************************************************//

class AlertDialogUtil {

  static showMessageDialog(context,
      {String? tipTitle,
      String? message,
      VoidCallback? sureClick,
      VoidCallback? cancelClick}) async {
    return showDialog(
        context: context,
        builder: (context) => Alert(
              title: tipTitle ?? "默认样式一",
              message: message ?? "这是默认样式一的内容信息",
              cancelConfig: CancelConfig(onTapCancel: cancelClick),
              confirmConfig: ConfirmConfig(onTapConfirm: sureClick),
            ));
  }

  static showMessageDialog1(context,
      {String? tipTitle,
      String? message,
      VoidCallback? sureClick,
      VoidCallback? cancelClick}) async {
    return showDialog(
        context: context,
        builder: (context) => Alert(
              title: tipTitle ?? "默认样式二",
              message: message ?? "这是默认样式二的内容信息",
              // cancelConfig: CancelConfig(),
              confirmConfig: ConfirmConfig(onTapConfirm: sureClick),
            ));
  }

  static showMessageDialog2(context,
      {String? message,
      VoidCallback? sureClick,
      VoidCallback? cancelClick}) async {
    return showDialog(
        context: context,
        builder: (context) => Alert(
              message: message ?? "无标题样式",
              cancelConfig: CancelConfig(onTapCancel: cancelClick),
              confirmConfig: ConfirmConfig(onTapConfirm: sureClick),
            ));
  }

  static showMessageDialog3(context,
      {String? tipTitle,
      Widget? contentWidget,
      VoidCallback? sureClick,
      VoidCallback? cancelClick}) async {
    return showDialog(
        context: context,
        builder: (context) => Alert(
              title: tipTitle ?? "自定义提示信息内容",
              content: contentWidget,
              cancelConfig: CancelConfig(onTapCancel: cancelClick),
              confirmConfig: ConfirmConfig(onTapConfirm: sureClick),
            ));
  }

  static showMessageDialog4(context,
      {String? tipTitle,
      Widget? contentWidget,
      VoidCallback? sureClick,
      VoidCallback? cancelClick}) async {

   return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Text('提示'),
            //标题
            titlePadding: EdgeInsets.all(20),
            //标题的padding值
            content: Text(
              '是否想放弃学习Flutter',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            //弹框展示主要内容
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            //内容的padding值
            actions: <Widget>[
              //操作按钮数组
              TextButton(
                onPressed: () {
                  print("取消");
                  Navigator.pop(context);
                  cancelClick ?? null;
                },
                child: Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  print('确定');
                  Navigator.pop(context);
                  sureClick ?? null;
                },
                child: Text('确定'),
              ),
            ],
          );
        });

  }

  static showDialogAbout(context) {
    return showAboutDialog(
        context: context,
        applicationName: 'Getx Demo',
        applicationVersion: '1.0.0',
        applicationIcon: Icon(Icons.ten_k),
        applicationLegalese: '杜杜的小demo',
        children: [
          Text('介绍介绍介绍介绍'),
          Text('介绍介绍介绍介绍'),
          Text('介绍介绍介绍介绍'),
        ]);
  }

  static showCustomeDialog(context,
      {bool canDismiss = true,
      double? widthValue,
      double? heightValue,
      Color bgColor = Colors.white,
      double? borderRadiusV,
      Widget? ContentWidget}) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: canDismiss, //是否可以点击背景关闭
        barrierLabel: '',
        transitionDuration: Duration(milliseconds: 400), //动画时长
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Center(
            child: Container(
              height: widthValue ?? 300,
              width: heightValue ?? 250,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(borderRadiusV ?? 20.w)),
              child: ContentWidget,
            ),
          );
        });
  }

  static showActionSheetDialog(context,
      {List? data, String? msg, ActionSheetCallback? onTapV}) {
    return ActionSheet.show(
        context: context,
        config: ActionSheetConfig(
            data: data ?? ["退出登录"],
            onTap: (index) {
              onTapV != null ? onTapV(index) : null;
            },
            style: TextStyle(color: Colors.red),
            message: msg ?? "退出后不会删除任何历史数据，下次登录依然可以使用本账号"));
  }

  static showBottomDialog(context,
      {double? heightV, Color? bgColor, double? borderRadiusV}) {
    return showModalBottomSheet(
        context: context,
        // elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusV ?? 30.w)),
        isScrollControlled: false,
        builder: (BuildContext context) {
          return Container(
              height: heightV ?? 250,
              decoration: BoxDecoration(
                  color: bgColor ?? Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadiusV ?? 30.w),
                      topRight: Radius.circular(borderRadiusV ?? 30.w))));
        });
  }


  static showProgressDialog(context,
      {double? heightV, Color? bgColor, double? borderRadiusV}) {
    var progress = 0.0;
    StateSetter? stateSetter;

    Timer.periodic(Duration(milliseconds: 200), (timer) {
      // 计时器模拟进度增加
      progress += 0.01;
      if (stateSetter != null) {
        stateSetter!(() {});
      }
      if (progress >= 1) {
        timer.cancel();
        stateSetter = null;
        Navigator.of(context).pop();
      }
    });
    return showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (ctx, state) {
          stateSetter = state;
          return Center(
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Card(
                      elevation: 24.0,
                      color: Colors.blue.withAlpha(240),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation(Colors.white),
                                value: progress),
                            SizedBox(height: 20),
                            Text("Loading...",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20),
                            Text(
                                "done ${((progress) * 100).toStringAsFixed(1)}%",
                                style: TextStyle(color: Colors.white))
                          ]))));
        }),
        // 点击dialog之外是否关闭dialog
        barrierDismissible: false);
  }
  /// 根据Android或IOS显示不同风格dialog
  ///
  static Future<Null> showDiffDialog(BuildContext context,
      {Widget? title,
        Widget? content,
        String? yesText,
        String? noText,
        EdgeInsetsGeometry? titlePadding,
        EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        VoidCallback? pressed,
        VoidCallback? cancelPressed}) async {
    await showDialog(
        context: context,
        builder: (context) => Utils.isAndroid
            ? AlertDialog(
            title: title,
            titlePadding: titlePadding,
            content: content,
            contentPadding: contentPadding,
            actions: <Widget>[
              FlatButton(
                onPressed: cancelPressed ?? () => Navigator.pop(context),
                child: Text(noText ??= '取消'),
              ),
              FlatButton(
                  onPressed: () => pressed!(),
                  child: Text(yesText ??= '确定'))
            ])
            : CupertinoAlertDialog(
            title: title,
            content: Padding(
                padding: const EdgeInsets.only(top: 20.0), child: content),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: cancelPressed ?? () => Navigator.pop(context),
                  child: Text(noText ??= '取消')),
              CupertinoDialogAction(
                  onPressed: () => pressed!(),
                  child: Text(yesText ??= '确定'))
            ]));
  }
  /**********************************ios样式**********************************************/
  static showCupertinoAlert(context,{String? tipTitle, String? message,String? cancelTitle,String? okTitle,VoidCallback? okOnTap}){
    return  showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(tipTitle??'提示'),
            //弹框标题
            content: Text(message??'是否想放弃学习Flutter', style: Theme.of(context).textTheme.subtitle1),
            //弹框内容
            actions: <Widget>[
              //操作控件
              CupertinoDialogAction(
                onPressed: () {
                  print("我不会放弃的");
                  Navigator.pop(context, cancelTitle??"取消");
                },
                child: Text('取消'), //控件显示内容
                isDefaultAction: true,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  print("我投降");
                  Navigator.pop(context, okTitle??"确定");
                  okOnTap??null;
                },
                child: Text('确定'),
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }
  static showCupertinoAlertWithButtons(context,{String? title,String? content, List? buttonList,ActionSheetCallback? onTapV}){
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
            title: Text(title??'Select Favorite Dessert'),
            content: Text(
                content?? 'Please select your favorite type of dessert from the'
                    'list below.Your selection will be used to customize the suggested list of eateries in your area.',
                style: Theme.of(context).textTheme.subtitle1),
            actions: buttonList!.map((item) => CupertinoDialogAction(
              child:  Text('$item'),
              isDestructiveAction:item=='Cancel'? true:false,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
                onTapV!(buttonList.indexOf(item));
              },
            )).toList()));
  }

  static showCupertinoActionSheet(context,{String? title,String? content, List? buttonList,ActionSheetCallback? onTapV}){
   return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
            title: Text(title??'请选择'),
            message: Text(
                content?? '补充描述',
                style: Theme.of(context).textTheme.subtitle1),
            actions: buttonList!.map((item) => CupertinoActionSheetAction(
              child:  Text('$item'),
              onPressed: () {
                Navigator.pop(context);
                onTapV!(buttonList.indexOf(item));
              },
            )).toList(),
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            )
        ));
  }


  static showCupertinoActionSheetWithCancel(context,
      {String? tipTitle,
      String? message,
      String? title1,
      String? title2,
      VoidCallback? ontap1,
      VoidCallback? ontap2}) {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text(tipTitle ?? '提示'),
            message: Text(message ?? '是否要删除当前项？'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(title1 ?? '删除'),
                onPressed: () {
                  Navigator.pop(context);
                  ontap1??null;
                },
                isDefaultAction: true,
              ),
              CupertinoActionSheetAction(
                child: Text(title2 ?? '暂时不删'),
                onPressed: () {
                      Navigator.pop(context);
                      ontap1??null;
                    },
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

/********************************************************************************/
  static showGifDialog(
    context, {
    required Widget image,
    required Text title,
    final VoidCallback? onOkButtonPressed,
    final Text? description,
    final bool? onlyOkButton=false,
    final Text? buttonOkText,
    final Text? buttonCancelText,
    final Color? buttonOkColor,
    final Color? buttonCancelColor,
    final double? buttonRadius = 10.0,
    final double? cornerRadius = 10.0,
  }) {
    return showDialog(
        context: context,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius!)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height:
                              (MediaQuery.of(context).size.height / 2) * 0.6,
                          child: Card(
                              elevation: 0.0,
                              margin: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(cornerRadius),
                                      topLeft: Radius.circular(cornerRadius))),
                              clipBehavior: Clip.antiAlias,
                              child: image),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: title),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: description),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: onlyOkButton!
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: <Widget>[
                              !onlyOkButton
                                  ? ElevatedButton (
                                child: buttonCancelText ?? Text('Cancel', style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                  backgroundColor:MaterialStateProperty.all(buttonCancelColor ?? Colors.grey),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(buttonRadius!))
                                  ),
                                ),
                                onPressed:() => Navigator.of(context).pop(),
                              )
                                  : Container(),
                              ElevatedButton (
                                child: buttonOkText ?? Text('OK', style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                    backgroundColor:MaterialStateProperty.all(buttonOkColor ?? Colors.green),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(buttonRadius!))
                                  ),
                                ),
                                onPressed:onOkButtonPressed??(){Navigator.of(context).pop();},
                              ),

                            ]),
                      ),
                    ]),
              ),
            ));


  }

  static showSnackBar(context,{String? title,String? actionString}){

    Get.snackbar( title!,actionString! );
    // Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text('收藏成功'),
    //     action: SnackBarAction(label: '撤销', onPressed: () {}),
    //     duration: Duration(milliseconds: 2000)));

     // ScaffoldMessenger(child: SnackBar(
     //     content: Text(title??'收藏成功'),
     //     action: SnackBarAction(label: actionString??'知道了', onPressed: () {}),
     //     duration: Duration(milliseconds: 2000)),);
  }

}
