import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';


class LightTheme extends StatelessWidget {
  final Widget child;

  LightTheme({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            accentColor: ColorsV.primaryColor,
            primaryColor: ColorsV.primaryColor,
            scaffoldBackgroundColor: Colors.grey[200],
            appBarTheme: AppBarTheme(
                iconTheme: lightIconTheme,
                elevation: 0.0,
                brightness: Brightness.light,
                color: Colors.white)),
        child: child);
  }
}
