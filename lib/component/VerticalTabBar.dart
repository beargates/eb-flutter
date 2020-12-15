import 'package:flutter/material.dart';

class VerticalTabBar extends StatefulWidget {
  final List tabs;
  final defaultIndex;
  final List<Widget> tabBarView;
  final void Function(int) onChange;

  VerticalTabBar(
      {this.tabs,
      this.onChange,
      this.defaultIndex = 0,
      @required this.tabBarView,
      labelColor,
      unselectedLabelColor})
      : assert(tabs != null),
        assert(tabBarView != null);

  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar> {
  int current;

  initState() {
    super.initState();

    current = widget.defaultIndex;
  }

  onChange(_) {
    current = _;
    setState(() {});
  }

  buildTabBar() {
    return ListView(
      children: widget.tabs.map((_) {
        var i = widget.tabs.indexOf(_);
        return FlatButton(onPressed: () => onChange(i), child: _);
      }).toList(),
    );
  }

  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 2, child: buildTabBar()),
      Expanded(
        flex: 5,
        child: CustomScrollView(slivers: [
          SliverFillRemaining(child: widget.tabBarView.elementAt(current))
        ]),
      )
    ]);
  }
}
