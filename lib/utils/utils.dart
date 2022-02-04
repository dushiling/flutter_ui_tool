
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {

  /// 获取运行平台是Android还是IOS
  static bool get isAndroid => Platform.isAndroid;


  static Future<Null> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 字符串转颜色
  ///
  /// [string] 字符串
  ///
  static Color strToColor(String string) {
    assert(string.length > 1);
    final int hash = string.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }


}