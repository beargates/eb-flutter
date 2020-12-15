import 'package:flutter/material.dart';
import 'package:get_it/component/SearchBox.dart';
import 'package:get_it/component/VerticalTabBar.dart';

class Feed extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<Feed> {
  static final List tabTitles = ['推荐', '超市', '男装', '奢侈品', '女装'];
  var tabs = tabTitles.map((_) => Tab(child: Text(_))).toList();

  buildTabBar() => VerticalTabBar(
        tabs: tabs,
        tabBarView: buildTabBarView(),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
      );

  buildTabBarView() {
    return tabs.map((_) {
      var i = tabs.indexOf(_);
      return Container(color: Colors.white, child: Text(i.toString()));
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.photo_camera_outlined),
        title: SearchBox('Macbook Pro'),
        actions: [Icon(Icons.message_rounded)],
      ),
      body: DefaultTabController(length: tabs.length, child: buildTabBar()),
    );
  }
}
