import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_tool/config/custom_icon.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/utils/theme_util.dart';

/// 统一AppBar
class SLAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function? function;
  final Color? backgroundColor;
  final Color? leadingColor;
  final automaticallyImplyLeading;
  final IconThemeData? iconTheme;
  final Function? backFun;
  final double? elevation;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  SLAppBarWidget(
      { Key? key,
        this.title,
        this.titleWidget,
        this.textStyle,
        this.actions,
        this.function,
        this.leadingColor,
        this.automaticallyImplyLeading = true,
        this.iconTheme,
        this.backFun,
        this.leadingWidget,
        this.elevation,
        this.backgroundColor,
        this.centerTitle:true,
        this.bottom,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget!=null ? Padding(padding: EdgeInsets.only(left: 20.w),child: leadingWidget):(automaticallyImplyLeading?backBtn(context):null),//BackButton()
      leadingWidth: 72.w,
      // /  backgroundColor: ThemeUtil.isDark(context)?Theme.of(context).scaffoldBackgroundColor:(backgroundColor??ColorsV.navigatorColor),
      title: titleWidget ?? Text(title!,style: textStyle == null ? ( ThemeUtil.isDark(context) ? TextStyles.TS_FFFFFF_W5_36sp:TextStyles.TS_FFFFFF_W5_36sp) : textStyle),//style: textStyle == null ? TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w600,color: Colors.black) : textStyle
      centerTitle: centerTitle,
      elevation: elevation ?? 0,//阴影
      shadowColor: ColorUtil.hexColor(Colors.white.value, alpha: 0.3),
      // iconTheme: iconTheme==null?IconThemeData(color: ThemeUtil.isDark(context)?Colors.white:(backgroundColor==Theme.of(context).scaffoldBackgroundColor?Colors.white:Colors.black)):iconTheme,
      actions: actions ?? null,
      bottom: bottom,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(SizeUtil.navigationBarHeight- SizeUtil.topSafeHeight);
}

Widget backBtn(BuildContext context){
  return InkWell(
  onTap: (){
  Navigator.pop(context);
  },
  child: Padding(child: Icon(Icons.arrow_back_ios,size: 40.w,),padding: EdgeInsets.only(left: 20.w)),
  // child: Container(
  //     width: 18.w,height: 32.h,
  //     child: Image.asset('assets/images/back.png',width: 18.w,height: 32.h),
  // ),
  );
  }

class ToolBar extends StatelessWidget {
  final Widget? leading;

  final bool automaticallyImplyLeading;

  final Widget? title;

  final List<Widget>? actions;

  final PreferredSizeWidget? bottom;

  final double elevation;

  final Color backgroundColor;

  final Brightness? brightness;

  final IconThemeData? iconTheme;

  final TextTheme? textTheme;

  final bool? centerTitle;

  ToolBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading: true,
    this.title,
    this.actions,
    this.bottom,
    this.elevation: 0.0,
    this.backgroundColor: Colors.transparent,
    this.brightness,
    this.iconTheme,
    this.textTheme,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtil.navigationBarHeight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: elevation,
          backgroundColor: backgroundColor,
          actions: actions,
          leading: leading,
          title: title,
          centerTitle: centerTitle,
          textTheme: textTheme,
          iconTheme: iconTheme,
          brightness: brightness,
          bottom: bottom,
          automaticallyImplyLeading: automaticallyImplyLeading,
        ),
      ),
    );
  }
}