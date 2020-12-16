import 'package:flutter/material.dart';
import 'package:get_it/component/SearchBox.dart';
import 'package:get_it/component/VerticalTabBar.dart';

class Feed extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<Feed> {
  static final List tabTitles =
      '推荐 超市 男装 奢侈品 女装 鞋 内衣配饰 箱包 美妆护肤 个护清洁 钟表珠宝 手机 数码 电脑办公'.split(' ');
  var tabs = tabTitles.map((_) => Text(_)).toList();

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
        leading: FlatButton(
          child: Icon(
            Icons.photo_camera_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            print(0);
          },
        ),
        title: SearchBox('Macbook Pro'),
        centerTitle: false,
        actions: [
          SizedBox(
            width: 50,
            child: FlatButton(
              child: Icon(
                Icons.message_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                print(1);
              },
            ),
          ),
        ],
      ),
      body: DefaultTabController(length: tabs.length, child: buildTabBar()),
    );
  }
}
