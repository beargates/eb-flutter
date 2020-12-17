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
    var defaultTextStyle = DefaultTextStyle.of(context).style;
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
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 2),
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return Row(
                        children: [
                          Checkbox(value: false),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: CartItem(thumbnail: url)))
                        ],
                      );
                    },
                    separatorBuilder: (ctx, index) => Divider(),
                    itemCount: 10),
              ),
            ),
            Container(
              width: screen(context).width,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(
                      width: 80,
                      child: IconButton(
                          icon: Row(children: [
                            SizedBox(width: 34, child: Checkbox(value: false)),
                            Text('全选'),
                          ]),
                          onPressed: null),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '合计:¥',
                                  style: defaultTextStyle
                                      .merge(TextStyle(fontSize: 20))),
                              TextSpan(
                                  text: '2,399',
                                  style: defaultTextStyle
                                      .merge(TextStyle(fontSize: 20))),
                              TextSpan(text: '.00', style: defaultTextStyle),
                            ],
                          ),
                        ),
                        Text('优惠减:¥300.00'),
                      ],
                    ),
                  ]),
                  Container(
                      color: Theme.of(context).primaryColor,
                      child: FlatButton(
                          onPressed: null,
                          child: Text('去结算(1)',
                              style: TextStyle(color: Colors.white))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
