import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';


class SelectTextItem extends StatelessWidget {
  const SelectTextItem({
    Key? key,
    this.onTap,
    required this.title,
    this.content: "",
    this.textAlign: TextAlign.end,
    this.style,
    this.leading,
    this.subTitle: "",
    this.height: 55.0,
    this.trailing,
    this.margin,
    this.bgColor,
    this.textStyle,
  })  : assert(title != null, height >= 50.0),
        super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle? style;
  final Widget? leading;
  final IconData? trailing;
  final String subTitle;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? Colors.white,
      child: InkWell(
          onTap: onTap,
          child: Container(
              height: height,
              margin: margin ?? EdgeInsets.only(right: 8.0, left: 8.0),
              width: double.infinity,
              child: Row(children: <Widget>[
                Offstage(
                    offstage: leading == null,
                    child: Row(children: <Widget>[
                      leading?? SizedBox() ,
                     SizedBox(width: 8)
                    ])),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('${title }',
                          style: textStyle ?? TextStyles.textDark28,
                          maxLines: 1),
                      Offstage(
                          offstage: subTitle.isEmpty,
                          child: Text(subTitle,
                              style: TextStyles.textGrey24,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis))
                    ]),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Text("${content}",
                            maxLines: 1,
                            textAlign: textAlign,
                            overflow: TextOverflow.ellipsis,
                            style: style ?? TextStyles.textGrey24))),
                Offstage(
                    offstage: onTap == null,
                    child: Icon(trailing ?? Icons.chevron_right, size: 22.0))
              ]))),
    );
  }
}
