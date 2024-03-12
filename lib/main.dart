import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/app/router_test_app.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/service/http_user_agent.dart';
import 'package:toonflix/util/const_values.dart';

/// project start
void main() {
  const buildmode = String.fromEnvironment(ConstValue.buildMode);
  print('buildmode: $buildmode');
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpUserAgentOverrides();
  setupGetIt();
  initStore();
  startRouterTest();
}
