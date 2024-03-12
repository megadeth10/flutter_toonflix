import 'package:toonflix/config/base_config.dart';
import 'package:toonflix/config/config_dev.dart';
import 'package:toonflix/config/config_release.dart';
import 'package:toonflix/config/config_staging.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/store/data_store.dart';
import 'package:toonflix/util/util.dart';

/// API Network 상수 값
class NetworkConst with LogCallback {
  /// API 서비스 호스트 url
  String _host = DevConfig().getHostUrl();
  String get host => _host;

  final String authorization = 'Authorization';

  /// API 서비스용 기본 토큰
  String _basicToken = DevConfig().getToken();
  String get basicToken => _basicToken;

  String bearer = 'bearer';

  late DataStore _dataStore;

  NetworkConst({
    DataStore? dStore,
  }) {
    _dataStore = dStore ?? getIt<DataStore>();
  }

  void init() {
    String buildMode = Util.getDeployMode();
    printLog('init: buildMode: $buildMode');
    BaseConfig config = DevConfig();
    if (buildMode == _BuildMode.staging.name) {
      config = StagingConfig();
    } else if (buildMode == _BuildMode.release.name) {
      config = ReleaseConfig();
    }
    _setValue(config);
  }

  void _setValue(BaseConfig config) {
    _host = config.getHostUrl();
    _basicToken = config.getToken();
  }

  String getToken() {
    String token = _basicToken;
    if (_dataStore.userToken?.isNotEmpty == true) {
      token = _dataStore.userToken!;
    }
    return '$bearer $token';
  }

  @override
  String getTagName() {
    return 'NetworkConst';
  }
}

enum _BuildMode {
  // ignore: unused_field
  dev,
  staging,
  release,
}
