import 'package:flutter/material.dart';

import 'package:get_it/component/VerticalIconButton.dart';
import 'package:get_it/prefab/GoodsList.dart';

class Mine extends StatefulWidget {
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircleAvatar(
                  child: FlutterLogo(
                    size: 56,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '欧买噶，买它',
                    style: TextStyle(fontSize: 32),
                  ),
                  IconButton(icon: Icon(Icons.settings), onPressed: null)
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: VerticalIconButton(
                    icon: '0',
                    iconSize: 24,
                    text: '商品收藏',
                    textSize: 16,
                    onPress: null,
                  )),
              Expanded(
                  flex: 1,
                  child: VerticalIconButton(
                    icon: '35',
                    iconSize: 24,
                    text: '浏览记录',
                    textSize: 16,
                    onPress: null,
                  )),
            ],
          ),
        )
      ],
    );
  }
  buildOrderArea() {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: VerticalIconButton(
                  icon: Icons.account_balance_wallet_outlined,
                  text: '待付款',
                  onPress: null,
                )),
            Expanded(
                flex: 1,
                child: VerticalIconButton(
                  icon: Icons.account_balance_wallet_sharp,
                  text: '待收货',
                  onPress: null,
                )),
            Expanded(
                flex: 1,
                child: VerticalIconButton(
                  icon: Icons.message_outlined,
                  text: '待评价',
                  onPress: null,
                )),
            Expanded(
                flex: 1,
                child: VerticalIconButton(
                  icon: Icons.attach_money_outlined,
                  text: '退换/售后',
                  onPress: null,
                )),
            Expanded(
                flex: 1,
                child: VerticalIconButton(
                  icon: Icons.format_list_bulleted,
                  text: '全部订单',
                  onPress: null,
                )),
          ],
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (ctx, _) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text('我的'),
          pinned: true,
        ),
        SliverToBoxAdapter(child: buildHeader()),
        SliverToBoxAdapter(child: buildOrderArea()),
        SliverToBoxAdapter(child: Card(
          elevation: 0,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: VerticalIconButton(
                      icon: '998',
                      iconSize: 22,
                      text: '积分',
                      onPress: null,
                    )),
                Expanded(
                    flex: 1,
                    child: VerticalIconButton(
                      icon: '0',
                      iconSize: 22,
                      text: '优惠券',
                      onPress: null,
                    )),
              ],
            ),
          ),
        )),
      ],
      body: GoodsList(),
    );
  }
}
