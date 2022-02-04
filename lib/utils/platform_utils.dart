import 'dart:io';
import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

export 'dart:io';

class PlatformUtils {
  //包
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getBuildNum() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
/******************************************************************/
  //设备
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }

  static Future<String> getDeviceInfoID() async {
     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo=await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo= await deviceInfo.iosInfo;
      return await iosDeviceInfo.identifierForVendor;
    } else {
      return '';
    }
  }
  static Future<String> getDeviceInfoName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.manufacturer + androidDeviceInfo.product + androidDeviceInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return getIosIphoneVersion(iosDeviceInfo.utsname.machine) + iosDeviceInfo.systemVersion;
    } else {
      return "";
    }
  }

  static String getIosIphoneVersion(String iphone) {
    if (iphone == 'iPhone3,1') return 'iPhone 4';
    if (iphone == 'iPhone3,2') return 'iPhone 4';
    if (iphone == 'iPhone3,3') return 'iPhone 4';
    if (iphone == 'iPhone4,1') return 'iPhone 4S';
    if (iphone == 'iPhone5,1') return 'iPhone 5';
    if (iphone == 'iPhone5,2') return 'iPhone 5c (GSM+CDMA)';
    if (iphone == 'iPhone5,3') return 'iPhone 5c (GSM)';
    if (iphone == 'iPhone5,4') return 'iPhone 4 (GSM+CDMA)';
    if (iphone == 'iPhone6,1') return 'iPhone 5s (GSM)';
    if (iphone == 'iPhone6,2') return 'iPhone 5s (GSM+CDMA)';
    if (iphone == 'iPhone7,1') return 'iPhone 6 Plus';
    if (iphone == 'iPhone7,2') return 'iPhone 6';
    if (iphone == 'iPhone8,1') return 'iPhone 6s';
    if (iphone == 'iPhone8,2') return 'iPhone 6s Plus';
    if (iphone == 'iPhone8,4') return 'iPhone SE';
    if (iphone == 'iPhone9,1') return 'iPhone 7';
    if (iphone == 'iPhone9,2') return 'iPhone 7 Plus';
    if (iphone == 'iPhone9,3') return 'iPhone 7';
    if (iphone == 'iPhone9,4') return 'iPhone 7 Plus';
    if (iphone == 'iPhone10,1') return 'iPhone_8';
    if (iphone == 'iPhone10,2') return 'iPhone_8_Plus';
    if (iphone == 'iPhone10,3') return 'iPhone X';
    if (iphone == 'iPhone10,4') return 'iPhone_8';
    if (iphone == 'iPhone10,5') return 'iPhone_8_Plus';
    if (iphone == 'iPhone10,6') return 'iPhone X';
    if (iphone == 'iPhone7,2') return 'iPhone 6';
    if (iphone == 'iPhone7,2') return 'iPhone 6';
    if (iphone == "iPhone11,8") return "iPhone XR";
    if (iphone == "iPhone11,2") return "iPhone XS";
    if (iphone == "iPhone11,6") return "iPhone XS Max";
    if (iphone == "iPhone11,4") return "iPhone XS Max";
    if (iphone == "iPhone12,1") return "iPhone 11";
    if (iphone == "iPhone12,3") return "iPhone 11 Pro";
    if (iphone == "iPhone12,5") return "iPhone 11 Pro Max";
    if (iphone == "iPhone12,8") return "iPhone SE2";
    if (iphone == "iPhone13,1") return "iPhone 12 mini";
    if (iphone == "iPhone13,2") return "iPhone 12";
    if (iphone == "iPhone13,3") return "iPhone 12 Pro";
    if (iphone == "iPhone13,4") return "iPhone 12 Pro Max";
    return iphone;
  }
}
