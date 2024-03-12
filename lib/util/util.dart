import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toonflix/router/router_test_config.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/const_values.dart';

class Util {
  /// 구문 출력
  static getCurrencyDisplayText(int value) {
    var formatter = NumberFormat('###,###');
    return formatter.format(value).replaceAll(",", " ");
  }

  ///화면크기를 알려줌, todo 그런데 해당 영역이 안드로이드 기준 상태바와 네비게이션 바를 포함하는지 확인해야함.
  static getScreenSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return screenSize;
  }

  /// 안드로이드 인지 확인
  static isAndroid() {
    return Platform.isAndroid;
  }

  /// IOS 인지 확인
  static isIOS() {
    return Platform.isIOS;
  }

  /// 텍스트 리소스
  static AppLocalizations getStringBundle(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  /// 텍스트 리소스
  static String getoperatingSystemVersion(BuildContext context) {
    return Platform.operatingSystemVersion;
  }

  /// 어플리케이션 빌드 모드
  static String getBuildMode() {
    var mode =
        const bool.fromEnvironment('dart.vm.product') ? 'Release' : 'Debug';
    print('Build mode: $mode');
    return mode;
  }

  static String getDeployMode() {
    var mode = const String.fromEnvironment(ConstValue.buildMode);
    print('Build mode: $mode');
    return mode;
  }

  /// Navigation 이동
  static goRoute(
    BuildContext context,
    ScreenName screenName, {
    Object? extra,
  }) {
    final location = routeScreenMap[screenName]?.location;
    if (location != null) {
      context.go(
        location,
        extra: extra,
      );
    }
  }

  static popAndgoRoute(
    BuildContext context,
    ScreenName screenName, {
    Object? extra,
  }) {
    context.pop();
    goRoute(
      context,
      screenName,
      extra: extra,
    );
  }

  /// 컬러 테이블에서 컬러값 가져오기
  static Color getColor(ColorName colorName) {
    return colorTable[colorName] ?? Colors.white;
  }

  // static BaseViewModel? getViewModel(BuildContext context, GlobalKey key) {
  //   return context.read<ViewModelStore>.findViewModel(key);
  // }

  /// 리소스 이미지 경로 만들기
  static String getAssetImagePath(String fileName) {
    return '${ConstValue.assetImagePath}/$fileName';
  }
}
