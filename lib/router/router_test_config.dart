import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toonflix/screen/animation_screen.dart';
import 'package:toonflix/screen/app_lifecycle_screen.dart';
import 'package:toonflix/screen/app_permission_screen.dart';
import 'package:toonflix/screen/app_state_screen.dart';
import 'package:toonflix/screen/app_state_sub_screen.dart';
import 'package:toonflix/screen/custom_font_screen.dart';
import 'package:toonflix/screen/detail_webtoon_screen.dart';
import 'package:toonflix/screen/device_app_configuration_screen.dart';
import 'package:toonflix/screen/image_test_screen.dart';
import 'package:toonflix/screen/main_screen.dart';
import 'package:toonflix/screen/mvvm_test_scree.dart';
import 'package:toonflix/screen/network_test_screen.dart';
import 'package:toonflix/screen/router_screen.dart';
import 'package:toonflix/screen/rx_dart_screen.dart';
import 'package:toonflix/screen/service_introduction_screen/service_introduction_scree.dart';
import 'package:toonflix/screen/text_fidel_screen.dart';
import 'package:toonflix/screen/toon_home_screen.dart';
import 'package:toonflix/screen/webview_test_screen.dart';
import 'package:toonflix/service/data/webtoon_model.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/app_state_sub_view_model.dart';

/// Router Screen의 router config
///

bool _ableExit = false;
const int timeSecond = 3;

final GoRouter routerTestGoRoute = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: routeScreenMap[ScreenName.home]?.path ?? "",
      builder: (BuildContext context, GoRouterState state) {
        return const RouterTestScreen();
      },
      onExit: (BuildContext context) {
        final isAndroid = Util.isAndroid();
        print('GoRouter onExit() start');
        if (isAndroid) {
          _showExitSnackbar(context);
        } else {
          _ableExit = true;
        }
        print('GoRouter onExit() result: $_ableExit');
        return _ableExit;
      },
      routes: <RouteBase>[
        GoRoute(
            path: routeScreenMap[ScreenName.serviceintroduction]?.path ?? "",
            builder: (context, state) {
              return const ServiceIntroductionScreen();
            }),
        GoRoute(
            path: routeScreenMap[ScreenName.main]?.path ?? "",
            builder: (context, state) {
              return const MainScreen();
            }),
        GoRoute(
            path: routeScreenMap[ScreenName.networktest]?.path ?? "",
            builder: (context, state) {
              return const NetworkTestScreen();
            }),
        GoRoute(
            path: routeScreenMap[ScreenName.networktest]?.path ?? "",
            builder: (context, state) {
              return const NetworkTestScreen();
            }),
        GoRoute(
          path: routeScreenMap[ScreenName.mvvmtest]?.path ?? "",
          builder: (context, state) {
            return const MVVMTestScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.rxdart]?.path ?? "",
          builder: (context, state) {
            return const RxDartScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.provider]?.path ?? "",
          builder: (context, state) {
            return AppStateScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: routeScreenMap[ScreenName.providerSub]?.path ?? "",
              builder: (context, state) {
                final GlobalKey key = GlobalKey();
                AppStateSubViewModel? extras =
                    _extrectExstras(state) as AppStateSubViewModel?;
                extras ??= AppStateSubViewModel(key);
                return AppStateSubScreen(viewModel: extras);
              },
            ),
          ],
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.textField]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return TextFieldScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.animation]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return const AnimationScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.configuration]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return ConfigurationScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.applifecycle]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return const AppLifecycleScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.permission]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return const AppPermissionTestScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.webview]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return WebViewTestScreen(
                initUrl: "https://megadeth10.github.io/c2cmarket");
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.imagetest]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return const ImageTestScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.fonttest]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return const CustomFontScreen();
          },
        ),
        GoRoute(
          path: routeScreenMap[ScreenName.toons]?.path ?? "",
          builder: (BuildContext context, GoRouterState state) {
            return ToonHomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: routeScreenMap[ScreenName.toonsDetail]?.path ?? "",
              builder: (context, state) {
                final item = state.extra;
                if (item != null && item is WebToonModel) {
                  return DetailWebtoonScreen(
                    model: item,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ],
    ),
  ],
);

/// state에서 extra를 추출함.
Object? _extrectExstras(GoRouterState state) {
  return state.extra;
}

/// AOS용 앱 종료 스넥바
void _showExitSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text("종료 합니다."),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: timeSecond),
      onVisible: () {
        _ableExit = true;
        Future.delayed(const Duration(seconds: timeSecond), () {
          _ableExit = false;
        });
      },
    ),
  );
}

/// 전체 화면 목록
Map<ScreenName, RouteScreenData> routeScreenMap = {
  ScreenName.home: RouteScreenData(
    path: '/',
    location: '/',
  ),
  ScreenName.animation: RouteScreenData(
    path: 'animation',
    location: '/animation',
  ),
  ScreenName.configuration: RouteScreenData(
    path: 'configuration',
    location: '/configuration',
  ),
  ScreenName.applifecycle: RouteScreenData(
    path: 'applifecycle',
    location: '/applifecycle',
  ),
  ScreenName.permission: RouteScreenData(
    path: 'permission',
    location: '/permission',
  ),
  ScreenName.webview: RouteScreenData(
    path: 'webview',
    location: '/webview',
  ),
  ScreenName.imagetest: RouteScreenData(
    path: 'imagetest',
    location: '/imagetest',
  ),
  ScreenName.fonttest: RouteScreenData(
    path: 'fonttest',
    location: '/fonttest',
  ),
  ScreenName.toons: RouteScreenData(
    path: 'toons',
    location: '/toons',
  ),
  ScreenName.toonsDetail: RouteScreenData(
    path: 'toonsDetail',
    location: '/toons/toonsDetail',
  ),
  ScreenName.textField: RouteScreenData(
    path: 'textField',
    location: '/textField',
  ),
  ScreenName.provider: RouteScreenData(
    path: 'provider',
    location: '/provider',
  ),
  ScreenName.providerSub: RouteScreenData(
    path: 'providerSub',
    location: '/provider/providerSub',
  ),
  ScreenName.rxdart: RouteScreenData(
    path: 'rxdart',
    location: '/rxdart',
  ),
  ScreenName.mvvmtest: RouteScreenData(
    path: 'mvvmtest',
    location: '/mvvmtest',
  ),
  ScreenName.networktest: RouteScreenData(
    path: 'networktest',
    location: '/networktest',
  ),
  ScreenName.serviceintroduction: RouteScreenData(
    path: 'serviceintroduction',
    location: '/serviceintroduction',
  ),
  ScreenName.main: RouteScreenData(
    path: 'main',
    location: '/main',
  ),
};

/// router를 사용할 데이터 객체
class RouteScreenData {
  final String path;
  final String location;
  RouteScreenData({
    required this.path,
    required this.location,
  });
}

/// 화면 이름 식별값
enum ScreenName {
  home,
  animation,
  configuration,
  applifecycle,
  permission,
  webview,
  imagetest,
  fonttest,
  toons,
  toonsDetail,
  textField,
  provider,
  providerSub,
  rxdart,
  mvvmtest,
  networktest,
  serviceintroduction,
  main,
}
