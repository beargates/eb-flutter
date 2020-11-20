import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:get_it/prefab/GoodsItem.dart';
import '../utils/CustomSliverPersistentHeaderDelegate.dart';
import '../utils/system.dart';
import '../utils/router.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

var urls = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605625406849&di=b0a8853da34777c45098c5200d799eba&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F141224%2F1-141224234108.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605625427609&di=baf3e3b1db268c15ea9a36a59365e643&imgtype=0&src=http%3A%2F%2Fimg.daimg.com%2Fuploads%2Fallimg%2F141025%2F1-141025231949.jpg',
  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2850181115,1915304120&fm=26&gp=0.jpg',
];
var icons = [
  Icons.shopping_cart,
  Icons.phonelink,
  Icons.phone_iphone,
  Icons.margin,
  Icons.accessibility_new,
  Icons.work_outline_outlined,
  Icons.auto_stories,
  Icons.airport_shuttle,
];
var titles = ['超市', '笔电', '手机', '电器', '服饰', '水果', '书籍', '百货'];

class _HomeState extends State<Home> {
  toBaidu() {
    pushWebview('https://www.baidu.com');
  }

  buildCarousel() => CarouselSlider(
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
                  child: Image.network(i, fit: BoxFit.contain));
            },
          );
        }).toList(),
      );

  List<Widget> buildGridMenu() {
    return titles.map((title) {
      var i = titles.indexOf(title);
      return Column(children: [
        IconButton(icon: Icon(icons[i]), onPressed: toBaidu),
        Text(title)
      ]);
    }).toList();
  }

  var tabs = const [
    Tab(child: Text('精选')),
    Tab(child: Text('新品')),
    Tab(child: Text('直播')),
    Tab(child: Text('实惠')),
    Tab(child: Text('进口')),
  ];

  buildTabBar() => TabBar(
      tabs: tabs,
      isScrollable: true,
      indicatorColor: Colors.red,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54);

  buildTabBarView() => TabBarView(
          children: tabs.map((index) {
        return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(20, (index) => GoodsItem()));
      }).toList());

  Widget build(BuildContext ctx) {
    return DefaultTabController(
      length: tabs.length,
      child: RefreshIndicator(
        child: SafeArea(
          child: NestedScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              headerSliverBuilder: (ctx, _) => [
                    SliverToBoxAdapter(
                      child: buildCarousel(),
                    ),
                    SliverGrid.count(
                        childAspectRatio: 1.3,
                        crossAxisCount: titles.length ~/ 2,
                        children: buildGridMenu()),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: CustomSliverPersistentHeaderDelegate(
                        minHeight: 40,
                        maxHeight: 50,
                        child: buildTabBar(),
                      ),
                    ),
                  ],
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildTabBarView(),
              )),
        ),
        notificationPredicate: (_) {
          // 返回true即可
          return true;
        },
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2), () {
            return true;
          });
        },
      ),
    );
  }
}
