import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/config/sp_keys.dart';
import 'package:flutter_ui_tool/utils/alert_dialog_util.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/sp_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'lang/switch_language_page.dart';
import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  final logic = Get.put(MineLogic());
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SLAppBarWidget(title: "tab_1".tr),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              title: Text("tab_4".tr),
            expandedHeight: 200,
            stretch: true,
            pinned: true, //标题栏是否固定
            backgroundColor: ColorsV.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('sliverBar'),
              // centerTitle: true,
              collapseMode: CollapseMode.parallax,
              background: Image.asset(
                'assets/images/SliverAppBar_bg1.png',
                fit: BoxFit.fitHeight,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
            ),
            actions: [
              InkWell(
                child: Image.asset(
                  'assets/images/night.png',
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.contain,
                ),
                onTap: (){
                  Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
                },
              ),
              SpacUtil.spacWidth20,
              InkWell(
                child: Image.asset(
                  'assets/images/setting.png',
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.contain,
                ),
                onTap: (){
                  Get.to(SwitchLanguagePage());
                },
              ),
              SpacUtil.spacWidth20,

            ],
          ),
          // SliverToBoxAdapter(
          //   child: Container(height: 200,color: Colors.blue),
          // ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                title: Text(
                  'item $index',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              childCount: 26,
            ),
          )
        ],
      ),
    );
  }
}
