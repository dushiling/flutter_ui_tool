import 'package:flutter/material.dart';

import 'home_drawable.dart';
class SideBarTwoHomePage extends StatefulWidget {
  const SideBarTwoHomePage({Key? key}) : super(key: key);

  @override
  _SideBarTwoHomePageState createState() => _SideBarTwoHomePageState();
}

class _SideBarTwoHomePageState extends State<SideBarTwoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage'),centerTitle: true,),
        body: Center(child: Text('SideBar2-左侧外部'),),
        drawer: Drawer(child: HomeDrawable())
    );
  }
}
