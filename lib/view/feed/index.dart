import 'package:flutter/material.dart';
import 'package:get_it/component/SearchBox.dart';
import 'package:get_it/component/VerticalTabBar.dart';
import 'package:get_it/view/utils/style.dart';

var url =
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3501216559,2547952336&fm=11&gp=0.jpg';

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

  buildTitle() {
    return Container(child: EMText(context, '二级菜单', ratio: 1.2, height: 3.1));
  }

  buildItem(index) {
    return SliverGrid.count(
      childAspectRatio: 0.7,
      crossAxisCount: 3,
      children: List.generate(
        6,
        (_) => Card(
          elevation: 0,
          child: Column(
            children: [
              Image.network(url),
              EMText(context, '商品名称$index'),
            ],
          ),
        ),
      ),
    );
  }

  buildTabBarView() {
    return tabs.map((_) {
      var i = tabs.indexOf(_);
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildTitle()),
          buildItem(i),
          SliverToBoxAdapter(child: buildTitle()),
          buildItem(i),
          SliverToBoxAdapter(child: buildTitle()),
          buildItem(i),
        ],
      );
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
