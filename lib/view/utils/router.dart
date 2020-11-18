import 'package:flutter/material.dart';
import '../webview/webview.dart';

GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

createPage(Widget page, Map navigationOptions, {bool withAppBar = true}) {
  String title = navigationOptions['title'];
  List<Widget> actions = navigationOptions['actions'];
  return Scaffold(
    appBar: withAppBar
        ? AppBar(
            title: title != null ? Text(title) : null,
            actions: actions,
          )
        : null,
    body: page,
  );
}

push(String url) {
  navigatorKey.currentState.pushNamed(url);
}

pushWebview(String url) {
  var state = navigatorKey.currentState;
  return state?.push(new MaterialPageRoute(builder: (context) {
    return WebView(url);
  }));
}
