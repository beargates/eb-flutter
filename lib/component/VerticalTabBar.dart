import 'package:flutter/material.dart';
import 'package:get_it/view/utils/style.dart';

class VerticalTabBar extends StatefulWidget {
  final List tabs;
  final defaultIndex;
  final List<Widget> tabBarView;
  final void Function(int) onChange;
  final VerticalTabController controller;

  VerticalTabBar({
    this.tabs,
    this.controller,
    this.onChange,
    this.defaultIndex = 0,
    @required this.tabBarView,
    labelColor,
    unselectedLabelColor,
  })  : assert(tabs != null),
        assert(tabBarView != null);

  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar> {
  int current;

  initState() {
    super.initState();

    current = widget.defaultIndex;
    widget.controller.addListener(onChange);
  }

  dispose() {
    super.dispose();
    widget.controller.removeListener(onChange);
  }

  onChange() {
    _changeTo(widget.controller.index);
  }

  _changeTo(int i) {
    if (current != i) {
      current = i;
      setState(() {});
    }
  }

  buildTabBar() {
    return ListView(
      children: widget.tabs.map((_) {
        var i = widget.tabs.indexOf(_);
        var isCurrent = i == current;
        return FlatButton(
          onPressed: () => _changeTo(i),
          child: EMText(context, _,
              ratio: isCurrent ? 1.2 : 1,
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal),
        );
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

class VerticalTabController extends ChangeNotifier {
  get index => _index;

  set index(i) => _changeTo(index);
  int _index;

  VerticalTabController({int initialPage = 0}) : _index = initialPage;

  _changeTo(int index) {
    _index = index;
    notifyListeners();
  }

  turnTo(int index) {
    _changeTo(index);
  }
}
