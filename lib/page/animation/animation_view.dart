import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/test_page/Animation/Tween/tween_animation_builder.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_align.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_builder.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_container.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_cross_fade.dart';

import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_icons.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_opacity.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_padding.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_physical_model.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_positioned.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_size.dart';
import 'package:flutter_ui_tool/test_page/Animation/Animated/animated_switcher.dart';
import 'package:flutter_ui_tool/test_page/Animation/Curves/curves_demo.dart';
import 'package:flutter_ui_tool/test_page/Animation/Other/route_sample.dart';
import 'package:flutter_ui_tool/test_page/Animation/Tween/tween.dart';
import 'package:flutter_ui_tool/test_page/Animation/plugins_animations/container_transition.dart';
import 'package:flutter_ui_tool/test_page/Animation/plugins_animations/fade_scale_transition.dart';
import 'package:flutter_ui_tool/test_page/Animation/plugins_animations/fade_through_transition.dart';
import 'package:flutter_ui_tool/test_page/Animation/plugins_animations/shared_axis_transition.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

import 'animation_logic.dart';

class AnimationPage extends StatelessWidget {
  final logic = Get.put(AnimationLogic());
  final state = Get.find<AnimationLogic>().state;

  List animationList =['AnimatedContainer','AnimatedOpacity','AnimatedSwitcher','AnimatedCrossFade','AnimatedBuilder','AnimatedIcons','AnimatedPadding','AnimatedAlign','AnimatedSize','AnimatedPositioned','AnimatedPhysicalModel'];
  List CurvesList =['Curves'];
  List TweenList =['Tween','AnimatedController+Animation+ColorTween'];
  List otherList =['路由过渡动画'];
  List pluginList =['container_transition','fade_scale_transition','fade_through_transition','shared_axis_transition','其他功能请自行探索'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: SLAppBarWidget(title: '动画',automaticallyImplyLeading: false),
         body: ListView(
           children: [
             ExpansionTile(
               initiallyExpanded: true,
               title: Text('Animation系列'),
               children: animationList.map((e) => ListTile(
                 contentPadding: EdgeInsets.only(left: 30, right: 20),
                 title: Text(e),
                 onTap: (){
                    int index= animationList.indexOf(e);
                   if(index==0){
                      Get.to(AnimatedContainerDemo());
                   }else if(index==1){
                      Get.to(AnimatedOpacityDemo());
                   }else if(index==2){
                      Get.to(AnimatedSwitcherSample());
                   }else if(index==3){
                      Get.to(AnimatedCrossFadeDemo());
                   }else if(index==4){
                      Get.to(AnimatedBuilderDemo());
                   }else if(index==5){
                     Get.to(AnimatedIconsDemo());
                   }else if(index==6){
                     Get.to(AnimatedPaddingDemo());
                   }else if(index==7){
                     Get.to(AnimatedAlignDemo());
                   }else if(index==8){
                     Get.to(AnimatedSizeDemo());
                   }else if(index==9){
                     Get.to(AnimatedPositionedDemo());
                   }else if(index==10){
                     Get.to(AnimatedPhysicalModelDemo());
                   }
                 },
               )).toList(),
             ),
             ExpansionTile(
               initiallyExpanded: true,
               title: Text('Tween'),
               children: TweenList.map((e) => ListTile(
                 contentPadding: EdgeInsets.only(left: 30, right: 20),
                 title: Text(e),
                 onTap: (){
                   int index= TweenList.indexOf(e);
                   if(index==0){
                     Get.to(TweenDemo());
                   }else if(index==1){
                     Get.to(FlutterAnimationWidget());
                   }
                 },
               )).toList(),
             ),
             ExpansionTile(
               initiallyExpanded: true,
               title: Text('Curves'),
               children: CurvesList.map((e) => ListTile(
                 contentPadding: EdgeInsets.only(left: 30, right: 20),
                 title: Text(e),
                 onTap: (){
                    int index= CurvesList.indexOf(e);
                   if(index==0){
                      Get.to(CurvesDemo());
                   }
                 },
               )).toList(),
             ),
             ExpansionTile(
               initiallyExpanded: true,
               title: Text('其他'),
               children: otherList.map((e) => ListTile(
                 contentPadding: EdgeInsets.only(left: 30, right: 20),
                 title: Text(e),
                 onTap: (){
                    int index= otherList.indexOf(e);
                   if(index==0){
                      Get.to(RouteSample());
                   }

                 },
               )).toList(),
             ),
             ExpansionTile(
               initiallyExpanded: true,
               title: Text('插件-animations'),
               children: pluginList.map((e) => ListTile(
                 contentPadding: EdgeInsets.only(left: 30, right: 20),
                 title: Text(e),
                 onTap: (){
                    int index= pluginList.indexOf(e);
                   if(index==0){
                      Get.to(OpenContainerTransformDemo());
                   }else if(index==1){
                       Get.to(FadeScaleTransitionDemo());
                   }else if(index==2){
                       Get.to(FadeThroughTransitionDemo());
                   }else if(index==3){
                     Get.to(SharedAxisTransitionDemo());
                   }
                 },
               )).toList(),
             ),
           ],
         )
    );
  }
}
