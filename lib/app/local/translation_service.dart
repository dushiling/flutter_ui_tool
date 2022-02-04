import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/utils/sp_util.dart';

import 'lang/en_US.dart';
import 'lang/zh_CN.dart';
class TranslationService extends Translations{

  // static Locale? get locale => Get.deviceLocale;
   static final fallbackLocale = Locale('zh', 'CN');

  static List<Map<String, String>> supperLocalData = [
    {"title": "跟随系统", "code": ""},
    {"title": "中文简体", "code": "zh_CN"},
    {"title": "English", "code": "en_US"}
  ];

  static Locale? getCurrentLanguage() {
    int index = SpUtils.getLocalLanguageIndex();
    Map data = TranslationService.supperLocalData[index];
    String code = data["code"];
    //跟随系统
    if (code == "") {
      var str = Get.deviceLocale.toString();
      if (str == 'en') {
        var locale = Locale('en', 'US');
        return locale;
      }
      return Get.deviceLocale;
      //其他
    } else {
      List codeList = code.split("_");
      var locale = Locale(codeList.first, codeList[1]);

      return locale;
    }
  }

  static String getCurrentLanguageCode() {
    int index = SpUtils.getLocalLanguageIndex();
    Map data = TranslationService.supperLocalData[index];
    String code = data["code"];
    //跟随系统
    if (code == "") {
      var str = Get.deviceLocale.toString();
      if (str == 'en') {
        return "en_US";
      }
      return "zh_CN";//默然语言
      //其他
    }else{
      return code;
    }
  }




  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': zh_CN,
    'en_US': en_US,

  };

}