import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_util.dart';
import 'dart:ui' as ui;

class TextStyles{


  static TextStyle TS_B1B1B1_30sp = TextStyle(
    fontSize: 30.sp,
    color: Color(0xffB1B1B1),
  );
  static TextStyle inputTextStyle = TextStyle(
      fontSize: 32.sp,
      color: Color(0xFF3C3C3C));
  static TextStyle hintTextGrey = TextStyle(
      fontSize: 28.sp,
      color: Color(0xFFCCCCCC));

  static TextStyle kLabelStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle hintTextWhite54 = TextStyle(
      color: Colors.white54);


  static TextStyle textGrey28 = TextStyle(fontSize: 28.sp, color: Colors.grey);
  static TextStyle textDark28 = TextStyle(fontSize: 28.sp, color: Color(0xFF333333));
  static TextStyle textBoldDark52 = TextStyle(fontSize: 52.sp, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle textBlue32 = TextStyle(fontSize: 32.sp, color: ColorsV.primaryColor);

  static TextStyle textBoldWhile80 = TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w400,color: Colors.white);
  static TextStyle textWhite32 = TextStyle(fontSize: 32.sp,color: Colors.white);
  static TextStyle textWhite28 = TextStyle(fontSize: 28.sp,color: Colors.white);

  static TextStyle textReader28 = TextStyle(fontSize:  28.sp, color: ColorsV.primaryColor);
  static TextStyle textGrey24 = TextStyle(fontSize:  24.sp, color:  Colors.grey);
  static TextStyle textRed32 = TextStyle(fontSize: 32.sp, color: Colors.red);
  static TextStyle textBoldDark26 = TextStyle(fontSize: 26.sp, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle TS_FFFFFF_W5_36sp = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xffFFFFFF),
  );
  static TextStyle TS_000000_W5_36sp = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );

  static const String fontName = 'WorkSans';
}

class SpacUtil{
  static Widget spacWidth20 = SizedBox(width: 20);

}

final kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
    ]);

const IconThemeData lightIconTheme = IconThemeData(color: Colors.black54);

/// 绘制文字
drawText(Canvas canvas, String text, Offset offset,
    {Color color = Colors.black,
      double width = 40,
      double? fontSize,
      String? fontFamily,
      TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.bold}) {
  /// 新建一个段落建造器，然后将文字基本信息填入;
  var paragraphBuilder = ui.ParagraphBuilder(
    ui.ParagraphStyle(
      fontFamily: fontFamily,
      textAlign: textAlign,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
  paragraphBuilder
    ..pushStyle(
        ui.TextStyle(color: color, textBaseline: ui.TextBaseline.alphabetic))
    ..addText(text);

  /// 这里需要先layout,将宽度约束填入，否则无法绘制
  var paragraph = paragraphBuilder.build()..layout(

    /// 设置文本的宽度约束
      ui.ParagraphConstraints(width: width));
  canvas.drawParagraph(paragraph, Offset(offset.dx, offset.dy));
}
