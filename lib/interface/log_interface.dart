import 'package:flutter/material.dart';

/// 로그 출력시에 위치 값을 위한 함수
mixin LogCallback {
  /// log용 객체 이름
  @protected
  String getTagName();

  @protected
  void printLog(String message) {
    print('${getTagName()} $message');
  }
}
