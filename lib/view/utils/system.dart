import 'package:flutter/material.dart';

// 判断是否处于debug模式
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

// 获取屏幕宽度
screen(BuildContext ctx) => MediaQuery.of(ctx).size;
