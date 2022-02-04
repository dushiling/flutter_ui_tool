import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/sp_keys.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/sp_util.dart';
import 'package:sp_util/sp_util.dart';

class ThemeUtil{

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      //主题色
      // primaryColor: ColorsV.primaryColor,
      // //导航栏颜色
      // appBarTheme: AppBarTheme(
      //   // titleTextStyle: isDarkMode ? TextStyles.TS_FFFFFF_W5_36sp:TextStyles.TS_000000_W5_36sp,
      //   backgroundColor: isDarkMode ? ColorsV.darkPageBgColor:ColorsV.primaryColor,
      //   foregroundColor: isDarkMode ? Colors.white:Colors.white,//根据需要设置
      //   iconTheme: isDarkMode ?IconThemeData(color: Colors.white):IconThemeData(color: Colors.white),//根据需要设置
      // ),

      // iconTheme: IconThemeData(color: Colors.white),

      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? ColorsV.darkPageBgColor :  ColorsV.pageBgColor,

    );
  }


  ThemeMode getThemeMode(){
    var theme =  SpUtil.getString(SPKeys.themeMode);
    switch(theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }


}