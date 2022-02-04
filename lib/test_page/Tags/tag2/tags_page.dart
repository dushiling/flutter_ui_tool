import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

import 'child/tags.dart';


class TagsPage extends StatelessWidget {
  List dataList = ["hello world", "hello flutter", "hello dart", "hello swift", "hello objective"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title:'Tags'),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("多选样式 + 默认选中"),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Tags(dataList,
                      indexes: [0, 2],
                      multiSelect: true,
                      borderColor: Colors.black,
                      selectedBackgroundColor: Colors.black,
                      selectedStyle: TextStyle(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    )
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Text("携程：热门推荐",  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Tags(["酒店", "机票", "火车票", "暑假旅游", "新疆夏行记", "汽车票", "杭州的酒店"],
                    backgroundColor: Colors.black12,
                    selectedBackgroundColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    leadingConfigs: [
                      TagConfig(Icon(Icons.hotel, color: Colors.orangeAccent, size: 17), 0, spacing: 2),
                      TagConfig(Icon(Icons.train, color: Colors.lightBlueAccent, size: 17,), 2),
                      TagConfig(Image.asset("assets/images/student_active.png",
                        width: 17,
                        color: Colors.lightBlueAccent,
                      ), 1, spacing: 2),
                    ],
                    trailingConfigs: [
                      TagConfig(Text("爆款价", style: TextStyle(fontSize: 12),), 4, spacing: 3)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Text("抖音：搜索记录",  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Tags(["空气炸锅", "儿童遥控飞机", "摩托车跑车", "智能手表", "电动豆浆机"],
                    crossAxisCount: 1,
                    fit: FlexFit.tight,
                    contentSpacing: 0,
                    leadingConfigs: [
                      TagConfig(Icon(Icons.watch_later_outlined, size: 17,), 0, spacing: 9),
                      TagConfig(Icon(Icons.watch_later_outlined, size: 17,), 1, spacing: 9),
                      TagConfig(Icon(Icons.watch_later_outlined, size: 17,), 2, spacing: 9),
                      TagConfig(Icon(Icons.watch_later_outlined, size: 17,), 3, spacing: 9),
                      TagConfig(Icon(Icons.watch_later_outlined, size: 17,), 4, spacing: 9),
                    ],
                    trailingConfigs: [
                      TagConfig(Icon(Icons.close_sharp, size: 15), 0,),
                      TagConfig(Icon(Icons.close_sharp, size: 15), 1,),
                      TagConfig(Icon(Icons.close_sharp, size: 15), 2,),
                      TagConfig(Icon(Icons.close_sharp, size: 15), 3,),
                      TagConfig(Icon(Icons.close_sharp, size: 15), 4,),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Text("哗哩哗哩：热搜", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Tags(["中国队第10金", "射手冠军玩射手吗", "马龙吹手调整状态", "今日奥运看点", "唐山大地震45周年", "IG战胜TES", "摩托车跑车", "智能手表", "车载收音机", "奥运会为何没有俄罗斯"],
                    crossAxisCount: 2,
                    contentSpacing: 0,
                    leadingConfigs: [
                      TagConfig(Text("1", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),), 0, spacing: 10),
                      TagConfig(Text("2", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),), 1, spacing: 10),
                      TagConfig(Text("3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),), 2, spacing: 10),
                      TagConfig(Text("4", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),), 3, spacing: 10),
                      TagConfig(Text("5", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),), 4, spacing: 10),
                      TagConfig(Text("6", style: TextStyle(color: Colors.black45),), 5, spacing: 10),
                      TagConfig(Text("7", style: TextStyle(color: Colors.black45),), 6, spacing: 10),
                      TagConfig(Text("8", style: TextStyle(color: Colors.black45),), 7, spacing: 10),
                      TagConfig(Text("9", style: TextStyle(color: Colors.black45),), 8, spacing: 10),
                      TagConfig(Text("10", style: TextStyle(color: Colors.black45),), 9, spacing: 10),
                    ],
                    style: TextStyle(
                        color: Colors.black87
                    ),
                    trailingConfigs: [
                      TagConfig(Container(
                        child: Text("热", style: TextStyle(color: Colors.white, fontSize: 8),),
                        width: 12,
                        height: 12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(2)
                        ),
                      ), 0, spacing: 5),
                      TagConfig(Container(
                        child: Text("新", style: TextStyle(color: Colors.white, fontSize: 8),),
                        width: 12,
                        height: 12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(2)
                        ),
                      ), 5, spacing: 5),
                    ],
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}