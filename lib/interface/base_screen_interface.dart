import 'package:flutter/material.dart';

/// 화면(Screen) widget에 필요한 기본 함수 정의 객체
abstract class BaseScreenCallback {
  @protected
  String? getTitle(BuildContext context);

  @protected
  Widget getBody(BuildContext context);

  @protected
  TextStyle? getTextStyle(BuildContext context);

  @protected
  Widget? getAppbar(BuildContext context);
}

/// viewmodel이 포함된 Screen State에 사용
// abstract class BaseStateScreenCallback extends BaseScreenCallback {
//   @protected
//   BaseViewModel createViewModel();
// }
