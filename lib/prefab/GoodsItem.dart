import 'package:flutter/material.dart';
import 'dart:math';

var urls = [
  'https://img10.360buyimg.com/n7/jfs/t1/120220/38/14828/70240/5f8615efE327bef58/c486de2dc73dfc15.jpg',
  'https://img13.360buyimg.com/n7/jfs/t1/138694/17/10615/68848/5f861345E105290e8/27a4a550d6b41eee.jpg',
  'https://img12.360buyimg.com/n7/jfs/t1/123867/38/14771/61500/5f86127fE5eb7705c/cec1b8ecc56996fe.jpg',
  'https://img11.360buyimg.com/n7/jfs/t1/136008/27/12201/63755/5f86183eE94974ea9/5b222af8470d04fd.jpg',
  'https://img12.360buyimg.com/n7/jfs/t1/128577/13/14950/76543/5f8618b8E83bbea6d/6fb92057970dee02.jpg',
];

class GoodsItem extends StatelessWidget {
  Widget build(BuildContext context) {
    var rng = Random();
    var index = rng.nextInt(urls.length);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.network(urls[index])),
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
