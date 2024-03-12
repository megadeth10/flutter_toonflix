import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/warpping_widget/warpping_app_lifecycle_statefulwidget.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

/// TODO 문제점 : 화면 라이프 사이클로 permission 상태 값이 갱신 되지 않는 문제가 있음.
class AppPermissionTestScreen extends BaseStatelessScreen {
  const AppPermissionTestScreen({super.key});

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PhotoPermission(),
      ],
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).termission_test_title;
  }

  @override
  String getTagName() {
    return 'AppPermissionTestScreen';
  }
}

class PhotoPermission extends StatefulWidget {
  const PhotoPermission({super.key});

  @override
  State<PhotoPermission> createState() => _PhotoPermissionState();
}

class _PhotoPermissionState extends AppLifecycleWidget<PhotoPermission> {
  final bool isAndroid = Util.isAndroid();
  bool? _isGrantedPhoto;
  bool? _isGrantedNotification;

  void _printStatus(PermissionStatus status, String permissionName) {
    print('_printStatus() ========= $permissionName =========');
    print('_printStatus() isDenied: ${status.isDenied}');
    print('_printStatus() isGranted: ${status.isGranted}');
    print('_printStatus() isLimited: ${status.isLimited}');
    print('_printStatus() isPermanentlyDenied: ${status.isPermanentlyDenied}');
    print('_printStatus() isProvisional: ${status.isProvisional}');
    print('_printStatus() isRestricted: ${status.isRestricted}');
    print('_printStatus() ====================================');
  }

  void _getPhotoPermissionStatue() async {
    var status = await Permission.photos.status;
    _printStatus(status, 'photos');
    _setPhotoStatus(status.isGranted);
  }

  void _getNotificationPermissionStatue() async {
    var status = await Permission.notification.status;
    // _printStatus(status, 'notification');
    _setNotifitaionStatus(status.isGranted);
  }

  void _setPhotoStatus(bool newState) {
    print('_setPhotoStatus() status: $newState');
    setState(() {
      _isGrantedPhoto = newState;
    });
  }

  void _setNotifitaionStatus(bool newState) {
    print('_setNotifitaionStatus() status: $newState');
    setState(() {
      _isGrantedNotification = newState;
    });
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    _initValue();
  }

  @override
  void initState() {
    super.initState();
    _initValue();
    addObserver();
  }

  @override
  void dispose() {
    removeObserver();
    super.dispose();
  }

  void _initValue() {
    _getPhotoPermissionStatue();
    _getNotificationPermissionStatue();
  }

  Widget _createTextWidget() {
    print('_createTextWidget() status: $_isGrantedPhoto');
    Widget widget = Container();
    if (_isGrantedPhoto != null) {
      widget = Text(
        _isGrantedPhoto! ? '권한 있음' : '권한 없음',
        style: korBold.copyWith(
          color: Colors.black,
        ),
      );
    }
    return widget;
  }

  Widget _createPhotoButtonWidget() {
    print('_createButtonWidget() status: $_isGrantedPhoto');
    Widget widget = Container();
    if (_isGrantedPhoto == false) {
      widget = TextButton(
        onPressed: () async {
          var result = await Permission.photos.request();
          _printStatus(result, 'photos');
          if (result.isPermanentlyDenied) {
            openAppSettings();
          }
        },
        child: Text(Util.getStringBundle(context).termission_test_title),
      );
    }
    return widget;
  }

  Widget _createAppSetting() {
    return TextButton(
      onPressed: () async {
        openAppSettings();
      },
      child: Text(Util.getStringBundle(context).application_setting),
    );
  }

  Widget _createNotificationButtonWidget() {
    print('_createNotificationButtonWidget() status: $_isGrantedNotification');
    Widget widget = Container();
    if (_isGrantedNotification == false) {
      widget = TextButton(
        onPressed: () async {
          var result = await Permission.notification.request();
          _printStatus(result, 'notification');
          if (result.isPermanentlyDenied) {
            openAppSettings();
          }
        },
        child: Text(Util.getStringBundle(context).notification),
      );
    }
    return widget;
  }

  Widget _createNotificationTextWidget() {
    print('_createTextWidget() status: $_isGrantedNotification');
    Widget widget = Container();
    if (_isGrantedNotification != null) {
      widget = Text(
        _isGrantedNotification! ? '권한 있음' : '권한 없음',
        style: korBold.copyWith(
          color: Colors.black,
        ),
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    print('build() isAndroid: $isAndroid');

    return Column(
      children: [
        _createTextWidget(),
        _createPhotoButtonWidget(),
        _createAppSetting(),
        _createNotificationButtonWidget(),
        _createNotificationTextWidget(),
      ],
    );
  }
}
