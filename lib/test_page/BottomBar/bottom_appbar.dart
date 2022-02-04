import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_ui_tool/page/mine/mine_view.dart';

import 'child/each_view.dart';

class BottomAppbarSample extends StatefulWidget {
  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbarSample> {
  List<Widget> list = [];

  int index = 0;

  @override
  void initState() {
    super.initState();
    list..add(EachView("Home"))..add(EachView("Airplay"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(EachView("Pages")),
        tooltip: "new page",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        // shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: index == 0? Colors.white:Colors.white.withOpacity(0.6),
              ),
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.airplay,
                color:index == 1? Colors.white:Colors.white.withOpacity(0.6),
              ),
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
        ),
      ),
    );
  }
}
