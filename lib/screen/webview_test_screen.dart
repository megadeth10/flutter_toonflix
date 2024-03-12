import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 자바 스크립트 함수명은 채널명.postMessage(String)으로 고정으로 사용해야하는거 같다.
class WebViewTestScreen extends BaseStatelessScreen {
  late WebViewController _controller;
  WebViewTestScreen({
    super.key,
    required String initUrl,
  }) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      // ..setNavigationDelegate(
      //   NavigationDelegate(
      //     onProgress: (int progress) {
      //       // Update loading bar.
      //     },
      //     onPageStarted: (String url) {},
      //     onPageFinished: (String url) {},
      //     onWebResourceError: (WebResourceError error) {},
      //     onNavigationRequest: (NavigationRequest request) {
      //       // if (request.url.startsWith('https://www.youtube.com/')) {
      //       //   return NavigationDecision.prevent;
      //       // }
      //       return NavigationDecision.navigate;
      //     },
      //   ),
      // )
      ..addJavaScriptChannel('DeleoWMS',
          onMessageReceived: (JavaScriptMessage message) {
        print('WebViewTestScreen DeleoWMS message: ${message.message}');
      })
      ..addJavaScriptChannel('GoodsConfirmModule',
          onMessageReceived: (JavaScriptMessage message) {
        print(
            'WebViewTestScreen GoodsConfirmModule message: ${message.message}');
      })
      ..addJavaScriptChannel('ShipbaesongEvent',
          onMessageReceived: (JavaScriptMessage message) {
        print('WebViewTestScreen ShipbaesongEvent message: ${message.message}');
      })
      ..addJavaScriptChannel('Toaster',
          onMessageReceived: (JavaScriptMessage message) {
        print('WebViewTestScreen Toaster message: ${message.message}');
      })
      ..loadRequest(Uri.parse(initUrl));
  }

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) => 'WebView Test';

  @override
  String getTagName() {
    return 'WebViewTestScreen';
  }
}
