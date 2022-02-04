import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/page/part/part_view.dart';
import 'package:flutter_ui_tool/utils/alert_dialog_util.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';

import 'animation/animation_view.dart';
import 'home/home_view.dart';
import 'mine/mine_view.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  List<Widget> pages = <Widget>[
    HomePage(),
    PartPage(),
    AnimationPage(),
    MinePage(),
  ];

  var _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 26.sp,
        unselectedFontSize: 24.sp,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        selectedItemColor: ColorsV.primaryColor,
        unselectedItemColor: ColorsV.textColor03,
        items: <BottomNavigationBarItem>[
          _renderNavigationBarItem(Icons.home, Icons.home, "tab_1".tr),
          _renderNavigationBarItem(Icons.account_tree, Icons.account_tree, "tab_2".tr),
          _renderNavigationBarItem(Icons.agriculture, Icons.agriculture, "tab_3".tr),
          _renderNavigationBarItem(Icons.account_circle, Icons.account_circle, "tab_4".tr),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
      // floatingActionButton: ClipOval(child: InkWell(child: Container( alignment:Alignment.center,width: 50,height: 50,color: ColorsV.primaryColor,child: Text('+',style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center)),onTap: (){
      //
      //   AlertDialogUtil.showMessageDialog(context);
      // })),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    );
  }


  BottomNavigationBarItem _renderNavigationBarItem(
      IconData icon, IconData iconHover, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 50.w,
      ),
      activeIcon: Icon(
        iconHover,
        size: 50.w,
      ),
      label: label,
    );
  }
}
