import 'package:flutter/material.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/network/network_const.dart';

/// screen마다 1:1로 생성된 ViewModel 추상 객체
abstract class BaseViewModel with LogCallback {
  /// 동일한 객체를 구분하기 위한 인자
  final GlobalKey _key;
  late String tag = "";
  @protected
  final NetworkConst networkConst = getIt<NetworkConst>();

  BaseViewModel(GlobalKey key) : _key = key {
    tag = getTagName();
  }

  /// 해당 V
  bool isThisViewModel(GlobalKey key) => _key == key;

  /// 초기화 할 필요가 있을시에
  void init();

  /// Widget에 제거됨을 알림
  void onDispose();
}
