import 'package:flutter/material.dart';

/// application 화면 lifecycle애 사용할 callback
abstract class AppLifecycleInterface {
  /// app lifecycle onResume
  @protected
  void onResume();

  /// app lifecycle onPause
  @protected
  void onPause();

  @protected
  void addObserver();

  @protected
  void removeObserver();
}
