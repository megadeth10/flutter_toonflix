import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_plus/platform_plus.dart';

class DeviceConfigurationStore {
  PackageInfo? _packageInfo;
  DeviceConfigurationStore() {
    print('DeviceConfigurationStore construture() this: $hashCode');
    _init();
  }

  void _init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    await PlatformPlus.platform.init();
  }

  /// 패키기 정보
  PackageInfo? getPackageInfo() => _packageInfo;

  /// 플랫폼 정보
  PlatformPlus getPlatformInfo() => PlatformPlus.platform;
}
