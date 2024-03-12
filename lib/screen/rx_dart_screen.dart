import 'package:flutter/material.dart';
import 'package:toonflix/screen/view/rx_dart_view.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class RxDartScreen extends BaseStatelessScreen {
  const RxDartScreen({super.key});

  @override
  Widget getBody(BuildContext context) {
    return const RxDartView();
  }

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).rxdart_text;
  }

  @override
  String getTagName() {
    return 'RxDartScreen';
  }
}
