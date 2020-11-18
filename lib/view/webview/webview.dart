import 'dart:io';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart' as WebViewHelper;

class WebView extends StatefulWidget {
  final String url;

  WebView(this.url);

  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid)
      WebViewHelper.WebView.platform = WebViewHelper.SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    return WebViewHelper.WebView(
      initialUrl: widget.url,
    );
  }
}
