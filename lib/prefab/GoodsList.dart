import 'package:flutter/material.dart';
import 'GoodsItem.dart';

class GoodsList extends StatefulWidget {
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.82,
        // 去掉多余的padding（GridView在刘海屏上会有多余的padding）
        padding: EdgeInsets.zero,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(20, (index) => GoodsItem()));
  }
}
