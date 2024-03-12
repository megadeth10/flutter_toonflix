import 'package:flutter/material.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/screen/toon_home_screen.dart';
import 'package:toonflix/store/data_store.dart';

/// 튠 플릭스 앱
/// app entry
void startToon() {
  // ignore: unused_local_variable
  final dataStore = getIt<DataStore>();
  runApp(ToonHomeScreen());
}
