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
  int selected = 1;
  var navBarTitles = ['首页', '分类', '购物车', '我'];
  var navBarIcons = [
    Icons.home_filled,
    Icons.format_list_bulleted,
    Icons.shopping_cart_outlined,
    Icons.person_outlined
  ];
  static final _home = Home();
  static final _feeds = Feed();
  static final _mine = Mine();
  static final _order = Order();
  static final List<Widget> _tabbarViews = [_home, _feeds, _order, _mine];

  void _onItemTapped(int index) {
    selected = index;
    setState(() {});
  }

  Widget build(BuildContext context) {
    var ctx = Theme.of(context);
    return Scaffold(
      drawer: Drawer(
        child: Mine(),
        elevation: 20.0,
      ),
      body: _tabbarViews.elementAt(selected),
//      body: IndexedStack(
//        index: selected,
//        children: _tabbarViews,
//      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ctx.scaffoldBackgroundColor,
        fixedColor: ctx.primaryColor,
        unselectedItemColor: ctx.unselectedWidgetColor,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: navBarTitles.map((_) {
          var index = navBarTitles.indexOf(_);
          return BottomNavigationBarItem(
              icon: Icon(navBarIcons[index], size: 32),
              label: navBarTitles[index]);
        }).toList(),
        onTap: _onItemTapped,
      ),
    );
  }
}
