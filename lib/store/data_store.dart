import 'dart:core';

import 'package:toonflix/enum/store_state.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/prefernce/secure_preference.dart';

/// TODO 싱글톤 객체는 생성되었으나 파일 저장에 문제가 있는 것으로 보임.
class DataStore with LogCallback {
  final BaseSecurePrefence _prefs = BaseSecurePrefence();
  // ignore: unused_field
  StoreState _state = StoreState.Init;
  List<String> _idList = [];

  /// TODO 파일에서 읽어와야함.
  String? _userToken;
  String? get userToken => _userToken;

  DataStore() {
    init();
  }

  Future<void> init() async {
    printLog("DataStore _init() hashcode: $hashCode");
    _loadData();
    _loadToken();
    _state = StoreState.Complete;
  }

  /// 파일에서 토큰 읽기
  Future<void> _loadToken() async {
    String? token = await _prefs.getString(
      StoreId.userTokenKey,
    );
    _userToken = token;
    printLog("loadData()  hashcode: $hashCode list: $_idList");
  }

  /// 파일에서 토큰 저장
  Future<void> storeToken(String newToken) async {
    _userToken = newToken;
    await _prefs.setString(
      StoreId.userTokenKey,
      newToken,
    );
    printLog("loadData()  hashcode: $hashCode list: $_idList");
  }

  Future<void> _loadData() async {
    final localList = await _prefs.getStringList(
      StoreId.idListKey,
    );
    _idList = localList;
    printLog("loadData()  hashcode: $hashCode list: $_idList");
  }

  List<String> getIdList() {
    return _idList;
  }

  Future<void> setIdList(List<String> list) async {
    await _prefs.setStringList(StoreId.idListKey, list);
    _idList = list;
  }

  Future<void> setInt(int value) async {
    // await _prefs.write(key: "test", value: value);
  }

  // 모든 데이터 삭제
  Future<void> clear() async {
    _reset();
    _prefs.allClear();
  }

  void _reset() {
    _idList = [];
    _userToken = null;
  }

  Future<List<String>> rawList() async {
    final pref = _prefs;
    final list = await pref.getStringList(StoreId.idListKey);
    printLog("rawList()  hashcode: $hashCode list: $list");
    return list;
  }

  @override
  String getTagName() {
    return 'DataStore';
  }
  // {
  //   print("DataStore _create() $hashCode");
  //   _init();
  // }
}

class StoreId {
  static const idListKey = 'id_list';
  static const userTokenKey = 'user_token';
}
