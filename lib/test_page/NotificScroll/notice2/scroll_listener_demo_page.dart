import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

///滑动监听
class ScrollListenerDemoPage extends StatefulWidget {
  @override
  _ScrollListenerDemoPageState createState() => _ScrollListenerDemoPageState();
}

class _ScrollListenerDemoPageState extends State<ScrollListenerDemoPage> {
  final ScrollController _scrollController = new ScrollController();

  bool isEnd = false;

  double offset = 0;

  String notify = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
        isEnd = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title: 'ScrollListenerDemoPage'),
      body: new Container(
        child: NotificationListener(
          onNotification: (dynamic notification) {
            String notify = "";
            if (notification is ScrollEndNotification) {
              notify = "ScrollEnd";
            } else if (notification is ScrollStartNotification) {
              notify = "ScrollStart";
            } else if (notification is UserScrollNotification) {
              notify = " UserScroll";
            } else if (notification is ScrollUpdateNotification) {
              notify = "ScrollUpdate";
            }
            setState(() {
              this.notify = notify;
            });
            return false;
          },
          child: new ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Card(
                child: new Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: new Text("Item $index"),
                ),
              );
            },
            itemCount: 100,
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new TextButton(
          onPressed: () {
            _scrollController.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.bounceInOut);
          },
          child: new Text("position: ${offset.floor()}"),
        ),
        new Container(width: 0.3, height: 30.0),
        new TextButton(
          onPressed: () {},
          child: new Text(notify),
        ),
        new Visibility(
          visible: isEnd,
          child: new TextButton(
            onPressed: () {},
            child: new Text("到达底部"),
          ),
        )
      ],
    );
  }
}
