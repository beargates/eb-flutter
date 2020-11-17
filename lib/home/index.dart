import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  int current = 0;

  void onClick() {
    current++;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(current.toString()),
        RaisedButton(child: Text('Click me!'), onPressed: onClick),
      ],
    );
  }
}
