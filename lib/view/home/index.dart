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

  Widget build(BuildContext ctx) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: buildCarousel(ctx),
        ),
        SliverGrid.count(
            crossAxisCount: titles.length ~/ 2, children: buildGridMenu(ctx)),
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverPersistentHeaderDelegate(
            minHeight: 50,
            maxHeight: 100,
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Text('123'),
            ),
          ),
        ),
        SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(11, (index) => GoodsItem())),
      ],
    );
  }
}
