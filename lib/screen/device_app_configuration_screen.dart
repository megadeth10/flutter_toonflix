import 'package:flutter/material.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/store/device_configuration_store.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class ConfigurationScreen extends BaseStatelessScreen {
  final DeviceConfigurationStore _deviceConfigurationStore =
      getIt<DeviceConfigurationStore>();
  ConfigurationScreen({super.key});

  Widget getOSVersion() {
    Widget versionWidget = Container();
    final isAndroid = Util.isAndroid();
    final isIos = Util.isIOS();
    print('getOSVersion() android: $isAndroid, ios: $isIos');
    if (isAndroid == true) {
      versionWidget = Text(
          'android osVersion: ${_deviceConfigurationStore.getPlatformInfo().androidVersionCode}');
    } else if (isIos == true) {
      versionWidget = Text(
          'ios osVersion: ${_deviceConfigurationStore.getPlatformInfo().iosVersion}');
    }
    return versionWidget;
  }

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    final versionWidget = getOSVersion();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('appName: ${_deviceConfigurationStore.getPackageInfo()?.appName}'),
        Text(
            'buildNumber: ${_deviceConfigurationStore.getPackageInfo()?.buildNumber}'),
        Text(
            'appNpackageNameame: ${_deviceConfigurationStore.getPackageInfo()?.packageName}'),
        Text('version: ${_deviceConfigurationStore.getPackageInfo()?.version}'),
        versionWidget,
        Text('buildMode: ${Util.getBuildMode()}'),
      ],
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) =>
      Util.getStringBundle(context).configuration_information;

  @override
  String getTagName() {
    return 'ConfigurationScreen';
  }
}
