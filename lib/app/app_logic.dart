import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter_ui_tool/utils/sp_util.dart';

import 'local/translation_service.dart';
class AppLogic extends GetxController {
  factory AppLogic() => _instance;

  AppLogic._internal(); // private constructor

  static final AppLogic _instance = AppLogic._internal();


  /// 当前选中的语言
  var currentLanguageTitle= ''.obs;
  var currentLanguageCode = ''.obs;

  Future<void> initAsync() async {
    /// 获取 本地的语言
    final int currentLanguageIndex = SpUtils.getLocalLanguageIndex();
    final Map<String, String> currentLanguageData = TranslationService.supperLocalData[currentLanguageIndex];
    currentLanguageTitle.value = currentLanguageData['title']??'';
    currentLanguageCode.value = TranslationService.getCurrentLanguageCode();

  }

  /// 切换语言
  changeLanguage(int index) {

    Map data = TranslationService.supperLocalData[index];
    String title = data["title"];
    String code = data["code"];
    //跟随系统
    if (code == "") {
      var str = Get.deviceLocale.toString();
      if (str == 'en') {
        var locale = Locale('en', 'US');
        Get.updateLocale(locale);//getx更新语言
      }
      Get.updateLocale(Get.deviceLocale??TranslationService.fallbackLocale);
      //其他
    } else {
      List codeList = code.split("_");
      var locale = Locale(codeList.first, codeList[1]);
      Get.updateLocale(locale);//getx更新语言
    }

    currentLanguageTitle.value = title;
    currentLanguageCode.value = code;

    SpUtils.setLocalLanguageIndex(index);
  }





}