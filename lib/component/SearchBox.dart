import 'package:flutter/material.dart';
import 'package:get_it/view/utils/style.dart' as CommonStyle;

Widget SearchBox(String holder) => CommonStyle.Radius(
  radius: 25,
  child: Container(
    height: 45,
    child: TextField(
      decoration: InputDecoration(
        // icon: Icon(Icons.send),  // leading
        prefixIcon: Icon(Icons.search_outlined),
        suffixIcon: Icon(Icons.add_a_photo_outlined),
        hintText: holder, // placeholder
        // helperText: 'Helper Text', // 输入框左下方的辅助说明文字
        // counterText: '0 characters', // 输入框右下方的辅助说明文字
        border: InputBorder.none,
      ),
    ),
  ),
);