import 'package:flutter/material.dart';
import 'package:toonflix/router/router_test_config.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

/// router 테스트 파일
class RouterTestScreen extends BaseStatelessScreen {
  const RouterTestScreen({super.key});

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(Util.getStringBundle(context).helloWorld),
          TextButton(
            onPressed: () =>
                Util.goRoute(context, ScreenName.serviceintroduction),
            child: const Text('쉽배송 온보딩 화면'),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.networktest),
            child: Text(Util.getStringBundle(context).network_test),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.mvvmtest),
            child: Text(Util.getStringBundle(context).mvvmtest),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.rxdart),
            child: Text(Util.getStringBundle(context).rxdart_text),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.provider),
            child: Text(Util.getStringBundle(context).app_state),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.textField),
            child: Text(Util.getStringBundle(context).text_field),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.animation),
            child: Text(Util.getStringBundle(context).animation_test),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.configuration),
            child:
                Text(Util.getStringBundle(context).configuration_information),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.applifecycle),
            child: Text(Util.getStringBundle(context).application_lifecycle),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.permission),
            child: Text(Util.getStringBundle(context).termission_test_title),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.toons),
            child: const Text('튠 목록'),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.fonttest),
            child: const Text('폰트 테스트'),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.imagetest),
            child: const Text('이미지 리소스'),
          ),
          TextButton(
            onPressed: () => Util.goRoute(context, ScreenName.webview),
            child: const Text('웹뷰 테스트'),
          ),
        ],
      ),
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) => "RouterTestScreen";

  @override
  String getTagName() {
    return 'RouterTestScreen';
  }
}
