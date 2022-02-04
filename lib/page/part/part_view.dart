import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/test_page/Address/address1/address_page_one.dart';
import 'package:flutter_ui_tool/test_page/Address/address2/citylist_custom_header_page.dart';
import 'package:flutter_ui_tool/test_page/Address/address3/country_page.dart';
import 'package:flutter_ui_tool/test_page/Date/date1/date_picker_page.dart';
import 'package:flutter_ui_tool/test_page/Date/date2/date_time_picker.dart';
import 'package:flutter_ui_tool/test_page/Date/date3/tick_click_demo_page.dart';
import 'package:flutter_ui_tool/test_page/Date/date4/canvas_click_demo_page.dart';
import 'package:flutter_ui_tool/test_page/DropDownMenu/menu1/dropdown_menu_sample.dart';
import 'package:flutter_ui_tool/test_page/DropDownMenu/menu2/drop_select_demo_page.dart';
import 'package:flutter_ui_tool/test_page/LateralSpreads/sliding_delete1/dismissible_widget.dart';
import 'package:flutter_ui_tool/test_page/LateralSpreads/sliding_delete2/SlidablePage.dart';
import 'package:flutter_ui_tool/test_page/NotificScroll/notice1/notification_listener.dart';
import 'package:flutter_ui_tool/test_page/NotificScroll/notice2/scroll_listener_demo_page.dart';
import 'package:flutter_ui_tool/test_page/RollPosition/roll2/scroll_to_index_demo_page2.dart';
import 'package:flutter_ui_tool/test_page/RollPosition/rool1/scroll_to_index_demo_page.dart';
import 'package:flutter_ui_tool/test_page/Slider/slider1/slider_widget.dart';
import 'package:flutter_ui_tool/test_page/Slider/slider2/range_slider_demo.dart';
import 'package:flutter_ui_tool/test_page/Slider/slider3/color_progress_demo_page.dart';
import 'package:flutter_ui_tool/test_page/Tags/tag1/chip_widget.dart';
import 'package:flutter_ui_tool/test_page/Tags/tag2/tags_page.dart';
import 'package:flutter_ui_tool/test_page/Tags/tag3/draggable_grid_page.dart';
import 'package:flutter_ui_tool/test_page/Widgets/check_switch_widget.dart';
import 'package:flutter_ui_tool/test_page/Widgets/floating_touch.dart';
import 'package:flutter_ui_tool/test_page/Widgets/icon_widget.dart';
import 'package:flutter_ui_tool/test_page/Widgets/image_widget.dart';
import 'package:flutter_ui_tool/test_page/Widgets/text_widget.dart';
import 'package:flutter_ui_tool/test_page/Widgets/toggle_buttons.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

import 'part_logic.dart';

class PartPage extends StatefulWidget {
  @override
  State<PartPage> createState() => _PartPageState();
}

class _PartPageState extends State<PartPage> {
  final logic = Get.put(PartLogic());
  final state = Get.find<PartLogic>().state;

  List widgetsList =['Text','ToggleButtons','Image','Icon','CheckSwich','全局悬浮按钮'];
  List addressList =['地址1--picker/联动','地址2--A-Z城市列表','地址3--国家或地区'];//'地址3--全屏三级','地址4--仿京东地址'
  List timeList =['时间1--picker年月日','时间2--picker日历选择','时间3--时钟动画绘制','时间4--绘制闹钟'];
  List tagList =['标签1--chip','标签2--热门','标签3--添加删除'];
  List sliderList =['slider1--单向','slider2--范围','slider3--无节点'];
  List slidDeleateList =['1--Dismissible','2--flutter_slidable'];
  List dropDownMenuList =['menu1--仿美团下拉筛选菜单','menu2--多选'];
  List rollPositionMList =['roll1--scroll_to_index','roll2--renderBox获取位移'];
  List notificationList =['lisen1','lisen2'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title: '局部',automaticallyImplyLeading: false),
      body: ListView(
        children: [

          ExpansionTile(
            title: Text('Widgets'),
            children: widgetsList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= widgetsList.indexOf(e);
                if(index==0){
                    Get.to(TextWidget());
                }else if(index==1){
                    Get.to(ToggleButtonsWidget());
                }else if(index==2){
                  Get.to(ImageWidget());
                }else if(index==3){
                  Get.to(IconWidget());
                }else if(index==4){
                  Get.to(CheckSwitchWidget());
                }else if(index==5){
                  Get.to(FloatingTouchDemoPage());
                }
              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('地址'),
            children: addressList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= addressList.indexOf(e);
                if(index==0){
                   Get.to(AddressPickerPage());
                }else if(index==1){
                   Get.to(CityListCustomHeaderPage());
                }else if(index==2){
                   Get.to(CountryPage());
                }
              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('时间/日期'),
            children: timeList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= timeList.indexOf(e);
                if(index==0){
                    Get.to(DatePickerPage());
                }else if(index==1){
                    Get.to(DateTimePicker());
                }else if(index==2){
                   Get.to(TickClickDemoPage());
                }else if(index==3){
                   Get.to(CanvasClickDemoPage());
                }
              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('标签'),
            children: tagList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= tagList.indexOf(e);
                if(index==0){
                    Get.to(ChipWidget());
                }else if(index==1){
                    Get.to(TagsPage());
                }else if(index==2){
                  Get.to(DraggableGridPage());
                }
              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('进度条'),
            children: sliderList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= sliderList.indexOf(e);
                if(index==0){
                    Get.to(SliderWidget());
                }else if(index==1){
                    Get.to(RangeSliderPage());
                }else if(index==2){
                  Get.to(ColorProgressDemoPage());
                }

              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('侧滑删除'),
            children: slidDeleateList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= slidDeleateList.indexOf(e);
                if(index==0){
                    Get.to(DismissibleWidget());
                }else if(index==1){
                    Get.to(SlidablePage());
                }

              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('下拉筛选菜单'),
            children: dropDownMenuList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= dropDownMenuList.indexOf(e);
                if(index==0){
                    Get.to(DropDownSample());
                }else if(index==1){
                    Get.to(DropSelectDemoPage());
                }

              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('滚动到指定位置'),
            children: rollPositionMList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= rollPositionMList.indexOf(e);
                if(index==0){
                    Get.to(ScrollToIndexDemoPage());
                }else if(index==1){
                    Get.to(ScrollToIndexDemoPage2());
                }

              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('监听所在位置'),
            children: notificationList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= notificationList.indexOf(e);
                if(index==0){
                    Get.to(ScrollNotificationDemo());
                }else if(index==1){
                    Get.to(ScrollListenerDemoPage());
                }

              },
            )).toList(),
          ),


        ],
      ),
    );
  }
}
