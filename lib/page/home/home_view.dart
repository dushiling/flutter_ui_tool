import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_ui_tool/test_page/Sliver/sliverAppBar_page.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/bottom_appbar.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/bottom_barview.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/bottom_navigation_bar.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/bubble_bottom_bar.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/convex_bottom_bar.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/cupertino_tabbar.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/curved_navigation_bar_sample.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/fancy_bottom_navigation.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/navigationbar_fixed.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/navigationbar_shifting.dart';
import 'package:flutter_ui_tool/test_page/BottomBar/titled_navigation_bar.dart';
import 'package:flutter_ui_tool/test_page/GuidePage/guide1/guide_one_page.dart';
import 'package:flutter_ui_tool/test_page/GuidePage/guide2/guide_two_page.dart';
import 'package:flutter_ui_tool/test_page/GuidePage/guide3/introduction_animation_screen.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login1/login_page.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login10/code_input.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login2/sliding_login.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login3/flip_login_page.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login4/signup.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login5/bottom_sheet_login.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login6/login.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login7/sign_in.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login8/flare_login.dart';
import 'package:flutter_ui_tool/test_page/LoginPage/login9/login_video_page.dart';
import 'package:flutter_ui_tool/test_page/Mine/mine1/member.dart';
import 'package:flutter_ui_tool/test_page/Mine/mine2/myself.dart';
import 'package:flutter_ui_tool/test_page/Mine/mine3/link_sliver_demo_page.dart';
import 'package:flutter_ui_tool/test_page/PersonCenter/person1/mine_page.dart';
import 'package:flutter_ui_tool/test_page/PersonCenter/person2/personal_center.dart';
import 'package:flutter_ui_tool/test_page/PersonCenter/person3/person_info_screen.dart';
import 'package:flutter_ui_tool/test_page/SideBar/sidebar1/navigation_home_screen.dart';
import 'package:flutter_ui_tool/test_page/SideBar/sidebar2/sidebar_two_homepage.dart';
import 'package:flutter_ui_tool/test_page/SideBar/sidebar3/sidebar_three_homepage.dart';
import 'package:flutter_ui_tool/test_page/SideBar/sidebar4/sidebar_four_homepage.dart';
import 'package:flutter_ui_tool/test_page/SideBar/sidebar5/inner_drawer.dart';
import 'package:flutter_ui_tool/test_page/Sliver/scroll_header_demo_page.dart';
import 'package:flutter_ui_tool/test_page/Sliver/sliver.dart';
import 'package:flutter_ui_tool/test_page/Sliver/sliver_widget.dart';
import 'package:flutter_ui_tool/test_page/TopBar/sliver_tab_demo_page.dart';
import 'package:flutter_ui_tool/test_page/TopBar/sliver_tab_demo_page2.dart';
import 'package:flutter_ui_tool/test_page/TopBar/sliver_tab_demo_page3/sliver_tab_demo_page3.dart';
import 'package:flutter_ui_tool/test_page/TopBar/top_bar_one.dart';
import 'package:flutter_ui_tool/test_page/TopBar/top_bar_three.dart';
import 'package:flutter_ui_tool/test_page/TopBar/top_bar_two.dart';
import 'package:flutter_ui_tool/test_page/alertdialog_test_page.dart';
import 'package:flutter_ui_tool/test_page/button_test_page.dart';
import 'package:flutter_ui_tool/test_page/textfield_test_page.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'home_logic.dart';

const APPBAR_SCROLL_OFFSET = 100; //??????????????????????????????

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;


  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  List topBarList = ['top_bar_NoScroll','top_bar_Scroll','top_bar_Height44','sliver_tab_NoScroll','sliver_tab_Scroll','sliver_tab_Extent'];
  List bottomBarList = ['NavigationBarFixed--??????','BottomLineBar--????????????','NavigationBarShifting--????????????','BubbleBottomBar','Titled Bottom Bar--????????????','CupertinoTabBar--iOS??????','BottomBar--floatingActionButton','FancyBottomNavigationBar','CurvedNavigationBar--??????','BottomBarView--????????????+????????????','ConvexBottombar--??????'];
  List sliverBarList = ['Sliver ????????????????????????','SliverAppBar+tab','Scroll_Header','Sliver ???NestedScrollView??????'];
  List LoginUIList = ['????????????1??????????????????','????????????2??????????????????','????????????3??????????????????','????????????4??????present??????','????????????5??????BottomSheet??????','????????????6????????????????????? ','????????????7--????????????','????????????8--??????????????????','????????????9--????????????','????????????10--?????????????????????'];
  List sideBarList =['SideBar1-????????????','SideBar2-????????????','SideBar3-??????????????????','SideBar4-????????????','SideBar5-????????????'];
  List mineList =['??????1-?????????????????????','??????2-vip??????','??????3-????????????',];
  List personCenterList =['????????????1-????????????','????????????2-???????????????','????????????3-??????????????????',];
  List guideList =['guide1-??????','guide2-??????????????????','guide3-????????????',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  // //?????????????????????????????????
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return  false;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true, //????????????
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      FloatingActionButton(onPressed: ()   {
                        Get.to(BtnTestPage());
                      },heroTag: 0,child: Text('Button')),
                      FloatingActionButton(onPressed: ()   {
                        Get.to(TextFidldTextPage());
                      },heroTag: 1,child: Text('TextFild',style: TextStyle(fontSize: 12),)),
                      FloatingActionButton(onPressed: ()  async {
                        Get.to(AlertDialogTestPage());
                      },heroTag: 2,child: Text('Alert')),

                    ],
                  ),

                 ExpansionTile(
                   title: Text('TabBar'),
                   children: topBarList.map((e) => ListTile(
                     contentPadding: EdgeInsets.only(left: 30, right: 20),
                     title: Text(e),
                     onTap: (){
                       int index= topBarList.indexOf(e);
                       if(index==0){
                         Get.to(TopBarOnePage());
                       }else if(index==1){
                         Get.to(TopBarTwoPage());
                       }else if(index==2){
                         Get.to(TopBarThreePage());
                       }else if(index==3){
                         Get.to(SliverTabDemoPage());
                       }else if(index==4){
                         Get.to(SliverTabDemoPage2());
                       }else if(index==5){
                         Get.to(SliverTabDemoPage3());
                       }
                     },
                       trailing: Icon(Icons.keyboard_arrow_right)
                   )).toList(),

                 ),

                  ExpansionTile(
                    title: Text('bottomNavigationBar'),
                    children: bottomBarList.map((e) => ListTile(
                        contentPadding: EdgeInsets.only(left: 30, right: 20),
                        title: Text(e),
                        onTap: () {
                          int index= bottomBarList.indexOf(e);
                          if(index==0){
                            Get.to(NavigationBarFixed());
                          }else if(index==1){
                            Get.to(BottomNavigationBarHomePage());
                          }else if(index==2){
                            Get.to(NavigationBarShifting());
                          }else if(index==3){
                            Get.to(BubbleBottomBarPage());
                          }else if(index==4){
                            Get.to(TitledNavigationBarDemo());
                          }else if(index==5){
                            Get.to(CupertinoTabBarSample());
                          }else if(index==6){
                            Get.to(BottomAppbarSample());
                          }else if(index==7){
                            Get.to(FancyBottomNavigationBar());
                          }else if(index==8){
                            Get.to(CurvedNavigationBarSample());
                          }else if(index==9){
                            Get.to(BottomBarViewDemo());
                          }else if(index==10){
                            Get.to(ConvexBottombar());
                          }
                        },
                        trailing: Icon(Icons.keyboard_arrow_right)
                    )).toList(),
                  ),
                  ExpansionTile(
                    title: Text('Sliver'),
                    children: sliverBarList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= sliverBarList.indexOf(e);
                        if(index==0){
                          Get.to(SliverWidget());
                        }else if(index==1){
                          Get.to(SliverAppBarPage());
                        }else if(index==2){
                          Get.to(ScrollHeaderDemoPage());
                        }else if(index==3){
                          Get.to(SliverPage());
                        }

                      },
                    )).toList(),
                  ),
                  ExpansionTile(
                    title: Text('????????????'),
                    children: LoginUIList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= LoginUIList.indexOf(e);
                        if(index==0){
                          Get.to(PasswordLoginPage());
                        }else if(index==1){
                          Get.to(SlidingLoginPage());
                        }else if(index==2){
                          Get.to(FlipLoginPage());
                        }else if(index==3){
                          Get.to(SignUpPage());
                        }else if(index==4){
                          Get.to(BottomSheetLoginPage());
                        }else if(index==5){
                           Get.to(PhoneLoginPage());
                        }else if(index==6){
                          Get.to(LoginScreen());
                        }else if(index==7){
                          Get.to(FlareLoginPage());
                        }else if(index==8){
                          Get.to(LoginVideoPage());
                        }else if(index==9){
                          Get.to(CodeInputViewPage());
                        }
                      },
                    )).toList(),
                  ),

                  ExpansionTile(
                    title: Text('?????????'),
                    children: sideBarList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= sideBarList.indexOf(e);
                        if(index==0){
                          Get.to(NavigationHomeScreen());
                        }else if(index==1){
                           Get.to(SideBarTwoHomePage());
                        }else if(index==2){
                           Get.to(SideBarThreeHomePage());
                        }else if(index==3){
                           Get.to(SideBarFoureHomePage());
                        }else if(index==4){
                          Get.to(InnerDrawerSample());
                        }
                      },
                    )).toList(),
                  ),

                  ExpansionTile(
                    title: Text('??????'),
                    children: mineList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= mineList.indexOf(e);
                        if(index==0){
                          Get.to(MemberPage());
                        }else if(index==1){
                           Get.to(MySelfPage());
                        }else if(index==2){
                           Get.to(LinkSliverDemoPage());
                        }
                      },
                    )).toList(),
                  ),
                  ExpansionTile(
                    title: Text('????????????'),
                    children: personCenterList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= personCenterList.indexOf(e);
                        if(index==0){
                          Get.to(PerSonOnePage());
                        }else if(index==1){
                          Get.to(PersonalCenterPage());
                        }else if(index==2){
                           Get.to(PersonInfoScreen());
                        }
                      },
                    )).toList(),
                  ),
                  ExpansionTile(
                    title: Text('?????????'),
                    children: guideList.map((e) => ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 20),
                      title: Text(e),
                      onTap: (){
                        int index= guideList.indexOf(e);
                        if(index==0){
                          Get.to(GuidePageOne());
                        }else if(index==1){
                          Get.to(GuidePageTwo());
                        }else if(index==2){
                          Get.to(IntroductionAnimationScreen());
                        }
                      },
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),


          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: SizeUtil.navigationBarHeight,
              color: ColorsV.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Text("tab_1".tr, style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
