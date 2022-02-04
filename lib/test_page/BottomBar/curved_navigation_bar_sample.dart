import 'package:flutter/material.dart';
import 'child/curved_navigation_bar.dart';
import 'child/each_view.dart';

class CurvedNavigationBarSample extends StatefulWidget {
  CurvedNavigationBarSample({Key? key}) : super(key: key);

  @override
  createState() => _CurvedNavigationBarSampleState();
}

class _CurvedNavigationBarSampleState extends State<CurvedNavigationBarSample>
    with SingleTickerProviderStateMixin {
  int _page = 0;

  late List<Widget> list ;

  @override
  void initState() {
    super.initState();
    list=[];
    list
      ..add(EachView('add'))
      ..add(EachView('list'))
      ..add(EachView('compare_arrows'))
      ..add(EachView('call_split'))
      ..add(EachView('perm_identity'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: list[_page],
        bottomNavigationBar: CurvedNavigationBar(
            items: <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
              Icon(Icons.call_split, size: 30),
              Icon(Icons.perm_identity, size: 30)
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            // animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) => setState(() {
                  _page = index;
                })));
  }
}
