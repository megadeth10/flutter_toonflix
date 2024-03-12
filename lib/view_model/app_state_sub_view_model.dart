import 'package:flutter/material.dart';
import 'package:toonflix/interface/view_model_interface.dart';

class AppStateSubViewModel extends BaseViewModel {
  int value = 1;
  AppStateSubViewModel(super.key);

  @override
  BaseViewModel createInstance(GlobalKey key) {
    return AppStateSubViewModel(key);
  }

  void setValue(int newValue) {
    value = newValue;
  }

  @override
  void init() {}

  @override
  void onDispose() {}

  @override
  String getTagName() {
    return 'AppStateSubViewModel';
  }
}
