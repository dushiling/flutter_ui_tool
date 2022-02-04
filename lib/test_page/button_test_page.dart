import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/config/enum.dart';
import 'package:flutter_ui_tool/widgets/button.dart';


class BtnTestPage extends StatefulWidget {
  const BtnTestPage({Key? key}) : super(key: key);

  @override
  _BtnTestPageState createState() => _BtnTestPageState();
}

class _BtnTestPageState extends State<BtnTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: Text('测试页面- Button')),
       body: Padding(
         padding: EdgeInsets.all(20),
         child:Column(
           children: [
             descTitle('自适应按钮'),
             Button(onPressed:(){},child: Text('扁平'),borderRadius: 0,),
             descTitle('自适应按钮'),
             Button(onPressed:(){},child: Text('圆角'),borderRadius: 15,),
             descTitle('指定宽高按钮'),
             Button(onPressed:(){},child: Text('指定宽高'),borderRadius: 10,width: 100,height: 30,),
             descTitle('自然圆角按钮'),
             Button(onPressed:(){},child: Text('自然圆角'),width: 100,height: 30, buttonShape: ButtonShape.CIRCLE),
             descTitle('圆形按钮'),
              Button(onPressed:(){},child: Text('圆形按钮'),buttonShape: ButtonShape.CIRCLE,width: 100,height: 100,color: Colors.green,borderColor: Colors.transparent,),
             descTitle('线框按钮'),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(onPressed:(){},child: Text('线框按钮1'),width: 100,height: 30, isHaveSide:true),
                SizedBox(width: 20),
                Button(onPressed:(){},child: Text('线框按钮2'),width: 100,height: 30, isHaveSide:true,color: Colors.orange,borderColor: Colors.green,borderRadius: 20,),
              ],
            ),
             descTitle('菱形按钮'),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Button(onPressed:(){},child: Text('菱形1'),buttonShape: ButtonShape.SQUARE_CORNER,borderRadius: 10,width: 100,height: 30),
                 SizedBox(width: 20),
                 Button(onPressed:(){},child: Text('菱形2'),buttonShape: ButtonShape.SQUARE_CORNER,borderRadius: 10,width: 100,height: 30,isHaveSide:true,borderColor: Colors.grey,borderWidth: 1,),
               ],
             ),
             descTitle('阴影按钮'),
             Button(onPressed:(){},child: Text('阴影'),borderRadius: 20,elevation: 5,shadowColor: Colors.orange,),
             descTitle('图标按钮'),
             Button(onPressed:(){},child: Text('图标按钮'),icon: Icons.ac_unit ,borderRadius: 20,width: 120,height: 36,),
           ],
         ),

       )
    );
  }

  Widget descTitle(String title){
    return Text(title);
  }

}
