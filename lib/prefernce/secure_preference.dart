import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toonflix/interface/log_interface.dart';

class BaseSecurePrefence with LogCallback {
  final _aosOption = const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final _iosOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static const _splitter = ',';
  late FlutterSecureStorage _prefs;

  BaseSecurePrefence() {
    _prefs = FlutterSecureStorage(
      aOptions: _aosOption,
      iOptions: _iosOptions,
    );
  }

  Future<void> setString(String key, String value) async {
    await _prefs.write(
      key: key,
      value: value,
      aOptions: _aosOption,
      iOptions: _iosOptions,
    );
    printLog("setString()  hashcode: $hashCode value: $value");
  }

  Future<String?> getString(String key) async {
    String? value = await _prefs.read(
      key: key,
      aOptions: _aosOption,
      iOptions: _iosOptions,
    );
    return value;
  }

  Future<void> setStringList(String key, List<String> list) async {
    var stringBuilder = "";
    for (final strValue in list) {
      stringBuilder += strValue;
      if (strValue != list.last) {
        stringBuilder += _splitter;
      }
    }
    await _prefs.write(
      key: key,
      value: stringBuilder,
      aOptions: _aosOption,
      iOptions: _iosOptions,
    );
    printLog("setStringList()  hashcode: $hashCode list: $list");
  }

  Future<List<String>> getStringList(
    String key,
  ) async {
    final value = await _prefs.read(
      key: key,
      aOptions: _aosOption,
      iOptions: _iosOptions,
    );

    List<String> retValue = [];
    try {
      if (value?.isNotEmpty == true) {
        retValue = value!.split(_splitter);
      }
    } catch (e) {
      printLog('getStringList() error: $e');
    }
    return retValue;
  }

  /// 파일에 모든 데이터 삭제;
  Future<void> allClear() async {
    await _prefs.deleteAll();
  }

  @override
  String getTagName() {
    return 'BaseSecurePrefence';
  }
}
