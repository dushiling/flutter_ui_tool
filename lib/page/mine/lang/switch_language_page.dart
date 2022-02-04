import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_tool/app/app_logic.dart';
import 'package:flutter_ui_tool/app/local/translation_service.dart';
import 'package:flutter_ui_tool/utils/color_util.dart';
import 'package:flutter_ui_tool/utils/sp_util.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
class SwitchLanguagePage extends StatefulWidget {
  const SwitchLanguagePage({Key? key}) : super(key: key);

  @override
  _SwitchLanguagePageState createState() => _SwitchLanguagePageState();
}

class _SwitchLanguagePageState extends State<SwitchLanguagePage> {

   List<String> textStList=[];
   int _selectindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    TranslationService.supperLocalData.forEach((element) {
      textStList.add(element["title"]??'');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title: 'mine_languages'.tr),
      body: ListView.separated(
          itemCount: textStList.length,
          separatorBuilder: (context, index) {return Divider(height: 1,color: ColorsV.borderColor01);},
          itemBuilder: (BuildContext context, index){return item(context, index,isSelect: SpUtils.getLocalLanguageIndex() == index);
          },
         ),
    );
  }

  Widget item(BuildContext context,int index,{bool isSelect=false}){
    return InkWell(
      onTap: (){
        _selectindex=index;
        setState(() {
        });

        ///更新语言选择
        AppLogic().changeLanguage(index);

      },
      child: Container(
        padding: EdgeInsets.only(left: 30.w,right: 30.w),
        width: double.infinity,
        height: 100.h,
        color: ColorsV.bgColor(context),
        // alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textStList[index]),
            isSelect ?Image.asset(
              'assets/images/mine_choose.png',
              width: 20,
              height: 11,
            ) : Container()
          ],
        ),
      ),
    );
  }
}
