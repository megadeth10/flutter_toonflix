import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toonflix/interface/view_model_interface.dart';
import 'package:toonflix/network/response/version_response.dart';
import 'package:toonflix/network/service/admin_client.dart';
import 'package:toonflix/util/util.dart';

class NetworkViewModel extends BaseViewModel {
  final versionControl = StreamController<Version?>();
  final logger = Logger();
  final dio = Dio(); // Provide a dio in
  late AdminClient _adminClient;
  Future<Version>? _futureVersion;
  Future<Version>? get futureVersion => _futureVersion;

  NetworkViewModel({
    required GlobalKey key,
    AdminClient? adminClient,
  }) : super(key) {
    dio.options.baseUrl = networkConst.host;
    _adminClient = adminClient ?? AdminClient(dio);
    print('host: ${networkConst.host}');
    print('token: ${networkConst.getToken()}');
  }

  void _setAppVersion(Version? newVersion) {
    versionControl.sink.add(newVersion);
  }

  Future<void> getVersion2() async {
    print('$tag getVersion()');
    final isAndroid = Util.isAndroid();
    final isIos = Util.isIOS();
    AppVersionOsCode? osCode;
    if (isAndroid && !isIos) {
      osCode = AppVersionOsCode.AOS;
    } else if (!isAndroid && isIos) {
      osCode = AppVersionOsCode.IOS;
    }
    final list = await _adminClient.getAppVersion(networkConst.getToken());

    logger.e(list);
    Version version;
    if (osCode != null) {
      final versionList =
          list.response.where((element) => element.osCode.code == osCode!.name);
      version = versionList.first;
    } else {
      version = list.response.first;
    }

    print('$tag getVersion() version: $version');
    _futureVersion = Future.value(version);
  }

  void getVersion() async {
    print('$tag getVersion()');
    final isAndroid = Util.isAndroid();
    final isIos = Util.isIOS();
    AppVersionOsCode? osCode;
    if (isAndroid && !isIos) {
      osCode = AppVersionOsCode.AOS;
    } else if (!isAndroid && isIos) {
      osCode = AppVersionOsCode.IOS;
    }
    _adminClient.getAppVersion(networkConst.getToken()).then((value) {
      logger.e(value);
      Version version;
      if (osCode != null) {
        final versionList = value.response
            .where((element) => element.osCode.code == osCode!.name);
        version = versionList.first;
      } else {
        version = value.response.first;
      }
      _setAppVersion(version);
      print('$tag getVersion() version: $version');
    });
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
    versionControl.close();
  }

  @override
  String getTagName() {
    return 'NetworkViewModel';
  }
}
