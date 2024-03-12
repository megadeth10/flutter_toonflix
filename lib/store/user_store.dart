class UserStore {
  static final UserStore _instance = UserStore._create();
  int _value = 0;

  factory UserStore() {
    print('UserStore() this:${_instance.hashCode}');
    _instance._loadData();
    return _instance;
  }

  UserStore._create();

  void _loadData() {
    print('loadData() start');
    var result = _getData();
    print('loadData() end $result');
  }

  void setValue(int a) {
    _value = a;
  }

  int getData() => _value;

  Future<String> _getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return "start";
    });
  }
}


// class MySingleton {
//   static final MySingleton _singleton = MySingleton._internal();

//   factory MySingleton() {
//     return _singleton;
//   }

//   MySingleton._internal();

//   void sayHello() {
//     print('Hello from Singleton!');
//   }
// }