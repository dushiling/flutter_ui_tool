/// https://github.com/CarGuo/gsy_flutter_demo/blob/master/lib/widget/floating_touch_demo_page.dart

import 'package:flutter/material.dart';

/// 全局悬浮按键
class FloatingTouchDemoPage extends StatefulWidget {
  @override
  createState() => _FloatingTouchDemoPageState();
}

class _FloatingTouchDemoPageState extends State<FloatingTouchDemoPage> {
  Offset offset = Offset(200, 200);

  final double height = 80;

  /// 显示悬浮控件
  _showFloating() {
    var overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: _buildFloating(overlayEntry!),
          ),
        ],
      );
    });

    /// 插入全局悬浮控件
    overlayState!.insert(overlayEntry);
  }

  /// 绘制悬浮控件
  _buildFloating(OverlayEntry overlayEntry) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanDown: (details) {
        offset = details.globalPosition - Offset(height / 2, height / 2);
        overlayEntry.markNeedsBuild();
      },
      onPanUpdate: (DragUpdateDetails details) {
        /// 根据触摸修改悬浮控件偏移
        offset = offset + details.delta;
        overlayEntry.markNeedsBuild();
      },
      onLongPress: () {
        overlayEntry.remove();
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          width: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(height / 2))),
          child: Text(
            "长按\n移除",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingTouchDemoPage"),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              _showFloating();
            },
            child: Text("显示悬浮")),
      ),
    );
  }
}
