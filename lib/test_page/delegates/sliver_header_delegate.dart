import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
///动态头部处理
class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate(
      {required this.minHeight,
        required this.maxHeight,
        required this.snapConfig,
        this.child,
        this.builder,
        this.vSync,
        this.changeSize = false});

  final double minHeight;
  final double maxHeight;
  final Widget? child;
  final Builder? builder;
  final TickerProvider? vSync;
  final bool changeSize;
  final FloatingHeaderSnapConfiguration snapConfig;
  AnimationController? animationController;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  TickerProvider? get vsync => vSync;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (builder != null) {
      return builder!(context, shrinkOffset, overlapsContent);
    }
    return child!;
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => snapConfig;
}
typedef Widget Builder(
    BuildContext context, double shrinkOffset, bool overlapsContent);