import 'package:flutter/material.dart';
import 'package:toonflix/interface/view_model_interface.dart';

class ViewModelStore {
  final Map<GlobalKey, BaseViewModel> _map = {};

  BaseViewModel? getViewModel(GlobalKey key) {
    return _map[key];
  }

  /// viewModel 제거
  void removeViewModel(GlobalKey key) {
    _map.remove(key);
  }

  /// ViewModel 찾기
  bool findViewModel(GlobalKey key) {
    final viewModel = _map[key];
    if (viewModel == null) {
      return false;
    }
    return true;
  }

  /// ViewModel 추가
  void addViewModel(GlobalKey key, BaseViewModel cls) {
    _map[key] = cls;
  }

  /// 스토어 초기화
  void init() {
    _map.clear();
  }
}
