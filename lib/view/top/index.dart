import 'package:flutter/material.dart';

import '../home/index.dart';
import '../feed/index.dart';
import '../mine/index.dart';
import '../order/index.dart';

class TopView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TopView> {
  int current = 0;
  int _selectedIndex = 0;
  static final List<Map<String, dynamic>> _bottomNavBarItems = [
    {"icon": Icons.list, "title": '首页'},
    {"icon": Icons.favorite, "title": '关注'},
    {"icon": Icons.message, "title": '消息'},
    {"icon": Icons.person, "title": '我'},
  ];

  static final _home = Home();
  static final _feeds = Feed();
  static final _mine = Mine();
  static final _order = Order();
  static final List<Widget> _tabbarViews = [_home, _feeds, _order, _mine];

  void onClick() {
    current++;
    setState(() {});
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Mine(),
        elevation: 20.0,
      ),
      body: _tabbarViews.elementAt(_selectedIndex),
//      body: IndexedStack(
//        index: _selectedIndex,
//        children: _tabbarViews,
//      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff1B1C20),
        currentIndex: _selectedIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: _bottomNavBarItems.map((_) {
          var current = _bottomNavBarItems.indexOf(_) == _selectedIndex;
          return BottomNavigationBarItem(
              icon: Icon(_['icon'], size: 0), /// 去掉icon
              title: Container(
                padding: EdgeInsets.only(bottom: 8),
                decoration: current
                    ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3)))
                    : null,
                child: Text(
                  _['title'],
                  style: TextStyle(fontSize: 20),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
