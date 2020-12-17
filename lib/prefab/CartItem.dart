import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String thumbnail;
  final double lineHeight = 100;

  CartItem({this.thumbnail});

  Widget build(BuildContext context) {
    var defaultTextStyle = DefaultTextStyle.of(context).style;
    return SizedBox(
      height: lineHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
              elevation: 0,
              margin: EdgeInsets.only(right: 10),
              child: SizedBox(
                  width: lineHeight,
                  height: lineHeight,
                  child: Image.network(thumbnail))),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('英特尔（Intel）NUC8i5BEH NUC迷你电脑主机 豆子峡谷 现在下单有满减活动',
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: '¥', style: defaultTextStyle),
                          TextSpan(
                              text: '2,399',
                              style: defaultTextStyle
                                  .merge(TextStyle(fontSize: 20))),
                          TextSpan(text: '.00', style: defaultTextStyle),
                        ],
                      ),
                    ),
                    SizedBox(width: 130, child: Stepper()),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// 计步器
class Stepper extends StatefulWidget {
  int initialValue;

  Stepper({this.initialValue = 0});

  _StepperState createState() => _StepperState();
}

class _StepperState extends State<Stepper> {
  int _value;
  TextEditingController _controller;

  initState() {
    super.initState();
    _value = widget.initialValue;
    _controller = TextEditingController();
  }

  increase() {
    _value = _value + 1;
    _controller.value = TextEditingValue(text: _value.toString());
    setState(() {});
  }

  decrease() {
    _value = _value - 1;
    _controller.value = TextEditingValue(text: _value.toString());
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 34,
            child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: _value == 0 ? null : decrease)),
        Expanded(
          child: Card(
            color: Color.fromARGB(255, 230, 230, 230),
            elevation: 0,
            child: SizedBox(
              height: 36,
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            width: 34,
            child: IconButton(icon: Icon(Icons.add), onPressed: increase))
      ],
    );
  }
}
