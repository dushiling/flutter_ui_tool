import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/app/local/translation_service.dart';

import 'package:flutter_ui_tool/page/welcome_index_page.dart';
import 'package:flutter_ui_tool/router/RouterConfig.dart';
import 'package:flutter_ui_tool/utils/log_utils.dart';
import 'package:flutter_ui_tool/utils/theme_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:sp_util/sp_util.dart';


import 'app/app_logic.dart';
import 'config/app_config.dart';
import 'network/http.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SpUtil.getInstance();
  await HttpUtils.init(baseUrl: AppConfig.APP_BASE_URL);
  await TostUtil.configLoading();
   await LogUtils.init();
  await AppLogic().initAsync();



  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size(AppConfig.INIT_WINDOWS_WIDTH, AppConfig.INIT_WINDOWS_HEIGHT),
        builder: () => GetMaterialApp(
              title: 'GetX Demo',
              home: SplashScreen(),
              theme: ThemeUtil().getTheme(isDarkMode: ThemeUtil().getThemeMode()==ThemeMode.dark),//设置一些xxx的主题颜色
              themeMode: ThemeUtil().getThemeMode(),//当前是什么模式：light、dart、system
              initialRoute: RouterConfig.main,
              getPages: RouterConfig.getPages,
              translations: TranslationService(),// 你的翻译
              locale: TranslationService.getCurrentLanguage(),// 将会按照此处指定的语言翻译
              fallbackLocale:TranslationService.fallbackLocale,// 添加一个回调语言选项，以备上面指定的语言翻译不存在
              builder: EasyLoading.init(),
            ));
  }
}
