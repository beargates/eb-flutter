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
