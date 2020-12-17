import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as Material;

// todo 各种设置圆形的方法 https://blog.csdn.net/changzengli/article/details/92782681
Widget Radius({radius, top, right, bottom, left, @Material.required child}) {
  return ClipRRect(
    //设置四周圆角 角度
    borderRadius: BorderRadius.all(Material.Radius.circular(radius.toDouble())),
    child: Container(
      color: Material.Colors.white,
      child: child,
    ),
  );
}

// 类前端文字em效果
Widget EMText(
  BuildContext context,
  Object text, {
  ratio = 1,
  fontWeight = Material.FontWeight.normal, height,
}) {
  var currentStyle = DefaultTextStyle.of(context).style;
  Widget child;
  if (text is String) {
    child = Text(text);
  }
  if (text is Widget) {
    child = text;
  }
  return DefaultTextStyle(
    style: currentStyle.merge(
      TextStyle(
        fontSize: currentStyle.fontSize * ratio,
        fontWeight: fontWeight,
        height: height?.toDouble() ?? 2,
      ),
    ),
    child: child,
  );
}
