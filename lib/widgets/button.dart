import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
// import 'package:flutter_app/enum/enum.dart';

class Button extends StatelessWidget {

  final Widget child;

  /// 圆角半径
  final double borderRadius;

  final VoidCallback? onPressed;

  /// 按钮文字颜色
  final Color? textColor;
  final Color? disabledTextColor;

  /// 按钮背景色
  final Color? color;
  final Color? disabledColor;
  final Color? highlightColor;

  final double width;
  final double height;

  final Color? disabledBorderColor;
  final Color? highlightedBorderColor;
  final double borderWidth;
  final Color borderColor;
  final double elevation;
  final Color? shadowColor;

  // shape
  final ButtonShape buttonShape;

  final IconData? icon;
   final bool isHaveSide;
  final bool halfRadius;//按钮圆角弧度

  Button({
     Key? key,
    required this.child,
     this.onPressed,
    this.borderRadius: 5.0,
    this.color,
    this.height: 42.0,
    this.textColor,
    this.disabledColor,
    this.highlightColor,
    this.disabledTextColor,
    this.width: double.infinity,
    this.disabledBorderColor,
    this.highlightedBorderColor,
    this.borderWidth: 1.0,
    this.borderColor: Colors.black,
    this.elevation:0,
    this.shadowColor,
    this.buttonShape: ButtonShape.NORMAL,
    this.icon,
    this.isHaveSide: false,
    this.halfRadius: false,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    OutlinedBorder shape;

    if (halfRadius) {
      shape = StadiumBorder(
          side: buttonShape == ButtonShape.OUTLINE
              ? BorderSide(color: borderColor, width: borderWidth)
              : BorderSide.none);
    } else {
      //线框
      if (buttonShape == ButtonShape.OUTLINE) {
        shape = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth)
        );
        //菱形
      } else if (buttonShape == ButtonShape.SQUARE_CORNER) {
        shape = BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );
        //圆形
      } else if (buttonShape == ButtonShape.CIRCLE || halfRadius) {
        shape = StadiumBorder();
        //圆角或无圆角 Fillet和NORMAL 模式
      } else {
        shape = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius));
      }
    }



    return Container(
      width: width,
      height: height,
      child: icon == null
          ?
      ElevatedButton(
          onPressed: onPressed,
          child: child,
          style:ButtonStyle(
            backgroundColor:MaterialStateProperty.all(color ?? ((isHaveSide||buttonShape == ButtonShape.OUTLINE) ? Colors.transparent :onPressed==null? Color(0xFFA5D3D9): ColorsV.primaryColor)),
            foregroundColor:MaterialStateProperty.all(textColor ?? ((isHaveSide||buttonShape == ButtonShape.OUTLINE) ?Colors.black:Colors.white)),//字体颜色
            overlayColor:MaterialStateProperty.all(highlightColor),// 高亮色，按钮处于focused, hovered, or pressed时的颜色
            side: MaterialStateProperty.all((isHaveSide||buttonShape == ButtonShape.OUTLINE)? BorderSide(color: borderColor, width: borderWidth) : BorderSide.none),//边框
            elevation:MaterialStateProperty.all(elevation),//阴影
             shadowColor: MaterialStateProperty.all(shadowColor),//阴影颜色
             shape: MaterialStateProperty.all(shape),//形状

          )
      )
          :
      ElevatedButton.icon(
        icon:Icon(icon, size: 22),
        label: child,
        onPressed: onPressed,
        style:ButtonStyle(
          backgroundColor:MaterialStateProperty.all(color ?? ((isHaveSide||buttonShape == ButtonShape.OUTLINE) ? Colors.transparent :onPressed==null? Color(0xFFA5D3D9): ColorsV.primaryColor)),
          foregroundColor:MaterialStateProperty.all(textColor ?? ((isHaveSide||buttonShape == ButtonShape.OUTLINE) ?Colors.black:Colors.white)),
          overlayColor:MaterialStateProperty.all(highlightColor),
          side: MaterialStateProperty.all((isHaveSide||buttonShape == ButtonShape.OUTLINE)? BorderSide(color: borderColor, width: borderWidth) : BorderSide.none),//边框
          elevation:MaterialStateProperty.all(elevation),//阴影
          shadowColor: MaterialStateProperty.all(shadowColor),//阴影颜色
          shape: MaterialStateProperty.all(shape),

        ), )

    );
  }
}
