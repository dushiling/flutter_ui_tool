
import 'package:flutter_ui_tool/config/sp_keys.dart';
import 'package:sp_util/sp_util.dart';

class SpUtils {

  static setLocalLanguageIndex(int index) async{
    return SpUtil.putInt(SPKeys.localeLanguageSpKey, index);;
  }

  static int getLocalLanguageIndex() {
    return SpUtil.getInt(SPKeys.localeLanguageSpKey) ?? 0;
  }


  static setToken(String token) async{
    return SpUtil.putString(SPKeys.Token, token);
  }

  static String getToken() {
    return SpUtil.getString(SPKeys.Token) ?? '';
  }


}