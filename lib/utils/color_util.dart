import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/theme_util.dart';

class ColorsV {

   /// 主题色 color
    static get primaryColor {
      return Color(0xFF60C1C9);
    }
    ///导航栏颜色
    static get navigatorColor {
      return Color(0xFF60C1C9);
    }
    ///背景色
    static get pageBgColor {
      return Color(0xFFF6F6F6);
    }
  /// 边框色
  static get borderColor01 {
    return Color(0xFFF2F4F6);
  }

    ///分割线颜色
    static get deviderLineColor {
      return Color(0xFFE5E5E5);
    }

    ///暗黑模式--背景色
    static get darkPageBgColor {
      return Color(0xFF131E2F);
    }

  static get greyCColor {
    return Color(0xFFCCCCCC);
  }

  /// text color
  static get textColor01 {
    return Color(0xFF2E363B);
  }

  /// 深灰
  static get textColor02 {
    return Color(0xff656F76);
  }

  /// 浅灰
  static get textColor03 {
    return Color(0xFF95A3AF);
  }

    static const Color notWhite = Color(0xFFEDF0F2);
    static const Color nearlyWhite = Color(0xFFFEFEFE);
    static const Color white = Color(0xFFFFFFFF);
    static const Color nearlyBlue = Color(0xFF00B6F0);
    static const Color nearlyBlack = Color(0xFF213333);
    static const Color grey = Color(0xFF3A5160);
    static const Color dark_grey = Color(0xFF313A44);
    static const Color darkText = Color(0xFF253840);
    static const Color darkerText = Color(0xFF17262A);


    ///特殊页面（ThemeUtil已有设置,不符合需求再使用）背景色、  Widget控件 背景色  ：默认白色
    static  bgColor(BuildContext context,{Color? color}){
      return ThemeUtil.isDark(context)? ColorsV.darkPageBgColor:(color??Colors.white);
    }

}

class ColorUtil {
  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }

}