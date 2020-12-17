import 'package:flutter/material.dart';
import 'package:get_it/prefab/CartItem.dart';
import 'package:get_it/view/utils/system.dart';

var url =
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3501216559,2547952336&fm=11&gp=0.jpg';

class Cart extends StatefulWidget {
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  static final List tabTitles = ['全部', '降价', '常买', '分类'];
  var tabs = tabTitles.map((_) => Tab(text: _)).toList();

  buildTabBar() => TabBar(
      tabs: tabs,
      isScrollable: true,
      indicatorColor: Colors.red,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54);

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Container(),
          elevation: 0,
          // 空的leading是为了保持title可以剧中
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('购物车'),
              IconButton(
                  icon: Icon(Icons.location_on_outlined), onPressed: () {})
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () {},
                child: Text('编辑', style: TextStyle(color: Colors.white)))
          ],
          bottom: PreferredSize(
              preferredSize: Size(0, 50),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  children: [
                    buildTabBar(),
                  ],
                ),
              )),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20),
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: CartItem(thumbnail: url),
                );
              },
              separatorBuilder: (ctx, index) => Divider(),
              itemCount: 10),
        ),
      ),
    );
  }
}
