import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/utils/size_util.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
class CountryPage extends StatelessWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title: '选择国家或地区'),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text('使用请参考插件：azlistview: ^2.0.0-nullsafety.0 的pub.dev官方案例：',style: TextStyles.textBlue32,),
          SizedBox(height: 10),
          Text('下面是本人的实现效果：'),
          SizedBox(height: 20,),
          ImageLoadView('assets/images/country.png',imageType:ImageType.assets,width: SizeUtil.width*0.6,height: SizeUtil.height*0.7,)
        ],
      ),
    );
  }
}
