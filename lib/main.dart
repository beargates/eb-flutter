import 'package:flutter/material.dart';

import './view/top/index.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EB',
      theme: ThemeData(
        // 状态栏图标与字体颜色为白色
        brightness: Brightness.dark,
        // 顶部导航栏和状态栏的颜色
        primaryColor: Colors.black,
        // 去掉点击控件背景出现的水波纹效果,即去掉md的效果
        splashColor: Colors.transparent,
        // 去掉点击控件点击时的背景色
        highlightColor: Colors.transparent,
        // 页面的背景色
        scaffoldBackgroundColor: Colors.black,
      ),
      home: TopView(),
      routes: {
        // "/base_info": (_) => BaseInfo(),
      },
    );
  }
}
