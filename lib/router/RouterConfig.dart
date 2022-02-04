import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_ui_tool/page/tab_page.dart';

class RouterConfig {
  static final String main = "/";



  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => TabPage()),
  ];

}