import 'package:flutter/material.dart';
import 'package:toonflix/screen/view/app_lifecycle_view.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class AppLifecycleScreen extends BaseStatelessScreen {
  const AppLifecycleScreen({super.key});

  @override
  Widget? getAppbar(Object context) => null;

  @override
  Widget getBody(BuildContext context) {
    return const AppLifecycleView();
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) =>
      Util.getStringBundle(context).application_lifecycle;

  @override
  String getTagName() {
    return 'AppLifecycleScreen';
  }
}
