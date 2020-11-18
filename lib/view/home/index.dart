import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:get_it/prefab/GoodsItem.dart';
import '../utils/CustomSliverPersistentHeaderDelegate.dart';
import '../utils/system.dart';
import '../utils/router.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var urls = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605625406849&di=b0a8853da34777c45098c5200d799eba&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F141224%2F1-141224234108.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605625427609&di=baf3e3b1db268c15ea9a36a59365e643&imgtype=0&src=http%3A%2F%2Fimg.daimg.com%2Fuploads%2Fallimg%2F141025%2F1-141025231949.jpg',
  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2850181115,1915304120&fm=26&gp=0.jpg',
];
var icons = [Icons.accessibility_new];
var titles = ['超市', '笔电', '手机', '电器', '服饰', '水果', '蔬菜', '百货'];

class _HomeState extends State<Home> {
  toBaidu() {
    pushWebview('https://www.baidu.com');
  }

  Widget buildCarousel(BuildContext ctx) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240.0,
        // aspectRatio: 16/9,
        viewportFraction: 0.9999,
        // initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: !isInDebugMode,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: true, /// 自动放大滚到中间的元素
        // onPageChanged: callbackFunction,
        // scrollDirection: Axis.horizontal,
      ),
      items: urls.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: screen(context).width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(i));
          },
        );
      }).toList(),
    );
  }

  List<Widget> buildGridMenu(BuildContext ctx) {
    return titles
        .map((title) => Column(children: [
              IconButton(icon: Icon(icons[0]), onPressed: toBaidu),
              Text(title)
            ]))
        .toList();
  }

  var tabs = const [
    Tab(child: Text('精选')),
    Tab(child: Text('新品')),
    Tab(child: Text('直播')),
    Tab(child: Text('实惠')),
    Tab(child: Text('进口')),
  ];
  Widget tabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: Colors.red,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54),
    );
  }

  // Widget tabBarView() {
  //   return TabBarView(
  //       children: tabs.map((index) {
  //         return GridView.count(
  //           mainAxisSpacing: 2,
  //           crossAxisSpacing: 2,
  //           children: _list,
  //           crossAxisCount: 3,
  //         );
  //       }).toList());
  // }

  Widget build(BuildContext ctx) {
    return DefaultTabController(
      length: tabs.length,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: buildCarousel(ctx),
          ),
          SliverGrid.count(
              crossAxisCount: titles.length ~/ 2, children: buildGridMenu(ctx)),
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeaderDelegate(
              minHeight: 40,
              maxHeight: 50,
              child: tabBar(),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: screen(ctx).width / 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.fromLTRB(
                      index % 2 == 0 ? 10 : 0,
                      index < 2 ? 10 : 0,
                      index % 2 == 1 ? 10 : 0,
                      index > 20 - 2 - 1 ? 10 : 0,
                    ),
                    child: GoodsItem());
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
