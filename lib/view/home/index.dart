import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../utils/system.dart';

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

  Widget buildGridMenu(BuildContext ctx) {
    return GridView.builder(
        itemCount: titles.length,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 横轴元素个数
            mainAxisSpacing: 20.0, // 纵轴间距
            crossAxisSpacing: 10.0, // 横轴间距
            childAspectRatio: 1.0), // 子组件宽高长度比例
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            IconButton(icon: Icon(icons[0]), onPressed: null),
            Text(titles[index])
          ]);
        });
  }

  Widget build(BuildContext ctx) {
    SliverGridDelegateWithFixedCrossAxisCount
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: buildCarousel(ctx),
        ),
        SliverList(delegate: SliverChildListDelegate(buildGridMenu(ctx)))
      ],
    );
  }
}
