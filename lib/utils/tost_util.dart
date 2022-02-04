
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'custom_animation.dart';
class TostUtil{


  static configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

  static showToast(String msg,{EasyLoadingToastPosition position = EasyLoadingToastPosition.center,EasyLoadingMaskType maskTypeV=EasyLoadingMaskType.none}) async{
    await EasyLoading.showToast(
      msg,
      toastPosition: position,
      maskType: maskTypeV,
    );
  }

  static showLoading({String? msg,EasyLoadingStyle? loadingStyle=EasyLoadingStyle.dark,EasyLoadingMaskType maskTypeV=EasyLoadingMaskType.none,EasyLoadingAnimationStyle? animationStyle=EasyLoadingAnimationStyle.opacity,EasyLoadingIndicatorType? indicatorType=EasyLoadingIndicatorType.fadingCircle}) async{
    EasyLoading.instance.loadingStyle = loadingStyle!;
    EasyLoading.instance.animationStyle = animationStyle!;
    EasyLoading.instance.indicatorType = indicatorType!;
    await EasyLoading.show (
      status: msg??'loading...',
      maskType: maskTypeV,
    );
  }

  static showSuccess({String? msg,EasyLoadingStyle? loadingStyle=EasyLoadingStyle.dark,EasyLoadingMaskType maskTypeV=EasyLoadingMaskType.none,EasyLoadingAnimationStyle? animationStyle=EasyLoadingAnimationStyle.opacity}) async{
    EasyLoading.instance.loadingStyle = loadingStyle!;
    EasyLoading.instance.animationStyle = animationStyle!;
     await EasyLoading.showSuccess(
         msg??'Great Success!',
         maskType: maskTypeV,
     );
  }

  static showError({String? msg,EasyLoadingStyle? loadingStyle=EasyLoadingStyle.dark,EasyLoadingMaskType maskTypeV=EasyLoadingMaskType.none,EasyLoadingAnimationStyle? animationStyle=EasyLoadingAnimationStyle.opacity}) async{
    EasyLoading.instance.loadingStyle = loadingStyle!;
    EasyLoading.instance.animationStyle = animationStyle!;
    await EasyLoading.showError(
      msg??'Failed with Error',
      maskType: maskTypeV,
    );
  }

  static showInfo({String? msg,EasyLoadingStyle? loadingStyle=EasyLoadingStyle.dark,EasyLoadingMaskType maskTypeV=EasyLoadingMaskType.none,EasyLoadingAnimationStyle? animationStyle=EasyLoadingAnimationStyle.opacity}) async{
    EasyLoading.instance.loadingStyle = loadingStyle!;
    EasyLoading.instance.animationStyle = animationStyle!;
    await EasyLoading.showInfo(
      msg??'Useful Information',
      maskType: maskTypeV,
    );
  }

  static showProgress(){
    Timer? _timer;
    late double _progress;

    _progress = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100),
            (Timer timer) {
          EasyLoading.showProgress(_progress,
              status: '${(_progress * 100).toStringAsFixed(0)}%');
          _progress += 0.03;

          print('_progress===$_progress');
          if (_progress >= 1) {
            _timer?.cancel();
            EasyLoading.dismiss();
          }
        });
  }


}