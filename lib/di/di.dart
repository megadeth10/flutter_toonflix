import 'package:get_it/get_it.dart';
import 'package:toonflix/network/network_const.dart';
import 'package:toonflix/provider/app_state.dart';
import 'package:toonflix/store/data_store.dart';
import 'package:toonflix/store/device_configuration_store.dart';
import 'package:toonflix/store/view_model_store.dart';

final getIt = GetIt.instance;

/// GetIt 설정
/// ref: https://pub.dev/packages/get_it
void setupGetIt() {
  getIt.registerSingleton(DataStore());
  getIt.registerSingleton(DeviceConfigurationStore());
  getIt.registerSingleton(AppState());
  getIt.registerSingleton(ViewModelStore());
  getIt.registerSingleton(NetworkConst());
  // Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}

/// store 초기화
void initStore() async {
  // ignore: unused_local_variable
  final DeviceConfigurationStore deviceConfigurationStore =
      getIt<DeviceConfigurationStore>();
  final DataStore dataStore = getIt<DataStore>();
  dataStore.init();
  final AppState appState = getIt<AppState>();
  appState.init();
  final ViewModelStore viewModelStore = getIt<ViewModelStore>();
  viewModelStore.init();
  final NetworkConst networkConst = getIt<NetworkConst>();
  networkConst.init();
}
