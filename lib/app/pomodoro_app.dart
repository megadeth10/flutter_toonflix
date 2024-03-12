import 'package:flutter/material.dart';
import 'package:toonflix/screen/pomodors.dart';
import 'package:toonflix/store/user_store.dart';

/// app entry
void startPomodoro() {
  UserStore userStore = UserStore();
  userStore.setValue(10);
  print('make UserStore userStore: value: ${userStore.getData()}');

  UserStore a = UserStore();
  print('make UserStore a: value: ${a.getData()}');
  a.setValue(100);
  print('a set 100 userStore: value: ${userStore.getData()}');
  runApp(const Pomodoro());
}
