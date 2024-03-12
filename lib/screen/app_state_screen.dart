import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/provider/app_state.dart';
import 'package:toonflix/router/router_test_config.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/app_state_sub_view_model.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class AppStateScreen extends BaseStatelessScreen {
  final AppStateSubViewModel _viewModel = AppStateSubViewModel(GlobalKey());
  AppStateScreen({super.key}) {
    print("AppStateScreen construture key: $key hashCode: $hashCode");
  }

  void setLoginState(BuildContext context, bool newState) {
    context.read<AppState>().changeLoginState(newState);
  }

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Text('isLogin: ${context.watch<AppState>().isLogin}'),
        TextButton(
          onPressed: () {
            Util.goRoute(context, ScreenName.providerSub, extra: _viewModel);
          },
          child: const Text(
            '하위 화면',
          ),
        ),
        Text('viewModel : ${_viewModel.value}'),
        TextButton(
          onPressed: () {
            _viewModel.setValue(_viewModel.value + 1);
          },
          child: const Text(
            '카운트 증가',
          ),
        ),
      ],
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).app_state;
  }

  @override
  String getTagName() {
    return 'AppStateScreen';
  }
}
