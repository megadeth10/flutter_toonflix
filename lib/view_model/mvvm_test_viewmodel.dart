import 'package:flutter/material.dart';
import 'package:toonflix/interface/view_model_interface.dart';

class MVVMTestViewModel extends BaseViewModel {
  MVVMTestViewModel(GlobalKey key) : super(key);

  @override
  MVVMTestViewModel createInstance(GlobalKey key) {
    return MVVMTestViewModel(key);
  }

  int value = 1;

  void call() {
    print('MVVMTestViewModel call() $hashCode');
  }

  @override
  void onDispose() {
    print('MVVMTestViewModel onDispose() $hashCode');
  }

  @override
  void init() {
    print('MVVMTestViewModel init() $hashCode');
  }

  @override
  String getTagName() {
    return 'MVVMTestViewModel';
  }
}
