import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/provider/app_state.dart';
import 'package:toonflix/router/router_test_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toonflix/store/view_model_store.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/util.dart';

/// navigationg route 테스트 앱
/// app entry
void startRouterTest() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          create: (_) => getIt<AppState>(),
        ),
        Provider<ViewModelStore>(
          create: (_) => getIt<ViewModelStore>(),
        )
      ],
      child: const RouteTestApp(),
    ),
  );
}

class RouteTestApp extends StatelessWidget {
  const RouteTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: Util.getColor(ColorName.primaryBlue),
        shadowColor: Util.getColor(ColorName.gray999999),
      ),
      routerConfig: routerTestGoRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ko'),
      ],
    );
  }
}
