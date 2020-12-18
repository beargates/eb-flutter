import 'package:flutter/material.dart';

/// [IconButton.icon]只支持横向布局
///
/// 默认使用icon+文字，也可自定义整个children
class VerticalIconButton extends StatelessWidget {
  Function() onPress;
  var icon;
  double iconSize;
  String text;
  double textSize;

  VerticalIconButton({
    this.onPress,
    this.icon,
    this.text,
    this.iconSize = 32,
    this.textSize = 16,
  });

  Widget build(BuildContext context) {
    var defaultStyle = DefaultTextStyle.of(context).style;
    if (icon is IconData) {
      icon = Icon(icon, size: iconSize);
    }
    if (icon is String) {
      icon = DefaultTextStyle(
          style: defaultStyle.merge(TextStyle(fontSize: iconSize)),
          child: Text(icon));
    }
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(margin: EdgeInsets.only(bottom: 6), child: icon),
          DefaultTextStyle(
              style: defaultStyle.merge(TextStyle(fontSize: textSize)),
              child: Text(text))
        ],
      ),
    );
  }
}
