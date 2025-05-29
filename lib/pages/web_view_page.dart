import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          forceDark: ForceDark.OFF
        ),
        initialUrlRequest: URLRequest(
          url: WebUri(widget.url),
      )
      )
    );
  }
}
