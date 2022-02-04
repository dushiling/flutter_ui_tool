import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:common_utils/common_utils.dart';

/// 输出Log工具类
class LogUtils {
  static const String tag = 'Getx-Demo';

  //const bool isDebug = true;//是否是调试模式
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  static  init() {
    LogUtil.init(isDebug: !inProduction);
  }

  static void d(String msg, {String tag = tag}) {
    LogUtil.d(msg, tag: tag);
  }

  static void e(String msg, {String tag = tag}) {
    LogUtil.e(msg, tag: tag);
  }

  static void v(String msg, {String? tag}) {
    LogUtil.v(msg, tag: tag);
  }

  static void print_(String msg) {
    if (!inProduction) {
      print(msg);
    }
  }

  static void json(String msg, {String tag = tag}) {
    if (!inProduction) {
      final dynamic data = convert.json.decode(msg);
      if (data is Map) {
        _printMap(data);
      } else if (data is List) {
        _printList(data);
      } else
        LogUtil.v(msg, tag: tag);
    }
  }

  // https://github.com/Milad-Akarie/pretty_dio_logger
  static void _printMap(Map data,
      {String tag = tag,
      int tabs = 1,
      bool isListItem = false,
      bool isLast = false}) {
    final bool isRoot = tabs == 1;
    final String initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) LogUtil.v('$initialIndent{', tag: tag);

    data.keys.toList().asMap().forEach((index, key) {
      final bool isLast = index == data.length - 1;
      var value = data[key];
      if (value is String) value = '\"$value\"';
      if (value is Map) {
        if (value.length == 0)
          LogUtil.v('${_indent(tabs)} $key: $value${!isLast ? ',' : ''}',
              tag: tag);
        else {
          LogUtil.v('${_indent(tabs)} $key: {', tag: tag);
          _printMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (value.length == 0) {
          LogUtil.v('${_indent(tabs)} $key: ${value.toString()}', tag: tag);
        } else {
          LogUtil.v('${_indent(tabs)} $key: [', tag: tag);
          _printList(value, tabs: tabs);
          LogUtil.v('${_indent(tabs)} ]${isLast ? '' : ','}', tag: tag);
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        LogUtil.v('${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}', tag: tag);
      }
    });

    LogUtil.v('$initialIndent}${isListItem && !isLast ? ',' : ''}', tag: tag);
  }

  static void _printList(List list, {String tag = tag, int tabs = 1}) {
    list.asMap().forEach((i, e) {
      final bool isLast = i == list.length - 1;
      if (e is Map) {
        if (e.length == 0) {
          LogUtil.v('${_indent(tabs)}  $e${!isLast ? ',' : ''}', tag: tag);
        } else {
          _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        LogUtil.v('${_indent(tabs + 2)} $e${isLast ? '' : ','}', tag: tag);
      }
    });
  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;
}
