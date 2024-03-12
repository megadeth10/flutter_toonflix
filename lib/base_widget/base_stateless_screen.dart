import 'package:flutter/material.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/interface/base_screen_interface.dart';
import 'package:toonflix/base_widget/safearea_scaffold_widget.dart';
import 'package:toonflix/interface/log_interface.dart';

/// 화면 기본 최상이 widget
abstract class BaseStatelessScreen extends StatelessWidget
    with LogCallback
    implements BaseScreenCallback {
  const BaseStatelessScreen({super.key});

  /// appBar 텍스트 스타일
  @override
  TextStyle? getTextStyle(BuildContext context) {
    return null;
  }

  /// appBar
  @override
  Widget? getAppbar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeAresScaffold(
      title: getTitle(context),
      body: getBody(context),
      appBar: getAppbar(context),
      titleTextStyle: getTextStyle(context) ??
          korMedium.copyWith(
            fontSize: 18,
            color: Colors.black,
          ),
    );
  }
}
