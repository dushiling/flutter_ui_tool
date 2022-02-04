import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/widgets/button.dart';
class SideBarFoureHomePage extends StatefulWidget {
  const SideBarFoureHomePage({Key? key}) : super(key: key);

  @override
  _SideBarFoureHomePageState createState() => _SideBarFoureHomePageState();
}

class _SideBarFoureHomePageState extends State<SideBarFoureHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(title: Text('HomePage'), centerTitle: true,actions: <Widget>[
          Padding(padding:  EdgeInsets.only( right: 6),child: Button(child: Text('筛选'),width:60,height: 10,color: Colors.transparent, onPressed: (){
            _key.currentState!.openEndDrawer();
          }),)
        ]),
        endDrawer: RightSideBarView(),
        body:Center(child: Text('SideBar4-右侧外部')));
  }
}

class RightSideBarView extends StatefulWidget {
  const RightSideBarView({Key? key}) : super(key: key);

  @override
  _RightSideBarViewState createState() => _RightSideBarViewState();
}

class _RightSideBarViewState extends State<RightSideBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 80, top: 0),
      color: Colors.white,
      child: ListView(),
    );
  }
}
