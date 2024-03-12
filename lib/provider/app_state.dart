import 'package:flutter/foundation.dart';

/// 앱 전체에 공유 되어야할 상태값
class AppState extends ChangeNotifier {
  bool _isLoginState = false;

  /// Internal, private state of the cart.
  /// An unmodifiable view of the items in the cart.
  bool get isLogin => _isLoginState;

  /// login 상태 업데이트와 알림
  void changeLoginState(bool newState) {
    if (_isLoginState != newState) {
      _isLoginState = newState;
      notifyListeners();
    }
  }

  /// 상태 초기화
  void init() {
    _isLoginState = false;
  }
}
