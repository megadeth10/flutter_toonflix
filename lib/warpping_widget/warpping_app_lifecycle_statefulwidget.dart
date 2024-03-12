import 'package:flutter/material.dart';
import 'package:toonflix/interface/app_lifecycle_interface.dart';

/// 화면 라이브 사이클을 포함한 stateful warpping widget
abstract class AppLifecycleWidget<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver
    implements AppLifecycleInterface {
  AppLifecycleState? appLifecycleState;

  @override
  void addObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void removeObserver() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appLifecycleState = state;
    switch (state) {
      case AppLifecycleState.resumed:
        {
          onResume();
          break;
        }
      case AppLifecycleState.paused:
        {
          onPause();
          break;
        }
      default:
        {
          break;
        }
    }
  }
}
