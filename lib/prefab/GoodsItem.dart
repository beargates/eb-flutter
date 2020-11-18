import 'package:flutter/material.dart';

var url =
    'https://img10.360buyimg.com/n7/jfs/t1/120220/38/14828/70240/5f8615efE327bef58/c486de2dc73dfc15.jpg';

class GoodsItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
                // todo width自动撑开
                children: [Image.network(url, width: 150)]),
            Text('¥5999.00', style: TextStyle(color: Color(0xFFe4393c))),
            Text(
                'Apple iPhone 12 mini (A2400) 64GB 蓝色 手机 支持移动联通电信5G 【你好，5G！】A14仿生芯片，超视网膜XDR全面屏，超瓷晶面板！升维大提速，称心更称手！详情',
                style: TextStyle(color: Color(0xFF666666)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}
