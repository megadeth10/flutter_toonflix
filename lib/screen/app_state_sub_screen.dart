import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/provider/app_state.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/app_state_sub_view_model.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class AppStateSubScreen extends BaseStatelessScreen {
  final AppStateSubViewModel? _viewModel;
  const AppStateSubScreen({super.key, AppStateSubViewModel? viewModel})
      : _viewModel = viewModel;

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
            setLoginState(context, false);
          },
          child: const Text(
            '로그 아웃',
          ),
        ),
        TextButton(
          onPressed: () {
            setLoginState(context, true);
          },
          child: const Text(
            '로그인',
          ),
        ),
        Text('count: ${_viewModel?.value}'),
        TextButton(
          onPressed: () {
            if (_viewModel != null) {
              final newValue = _viewModel.value + 1;
              _viewModel.setValue(newValue);
            }
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
    return Util.getStringBundle(context).app_state_sub;
  }

  @override
  String getTagName() {
    return 'AppStateSubScreen';
  }
}
