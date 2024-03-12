import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/base_widget/safearea_scaffold_widget.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/interface/base_screen_interface.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/interface/view_model_interface.dart';
import 'package:toonflix/store/view_model_store.dart';
import 'package:toonflix/warpping_widget/warpping_app_lifecycle_statefulwidget.dart';

/// statefull widget이 화면 base로 사용할 class
/// view -> viewModel 방식으로 사용하기위해 viewmodel lifecycle을 마추기 위함.
abstract class BaseStatefulScreen<VM extends BaseViewModel>
    extends AppLifecycleWidget<StatefulWidget>
    with LogCallback
    implements BaseScreenCallback {
  @protected
  ViewModelStore? viewModelStore;

  @protected
  GlobalKey viewModelKey = GlobalKey();

  @protected
  late VM? viewModel;

  @override
  void initState() {
    super.initState();
    addObserver();
    viewModel = createViewModel();
    viewModel?.init();
  }

  @override
  void dispose() {
    removeObserver();
    viewModel?.onDispose();
    viewModelStore?.removeViewModel(viewModelKey);
    super.dispose();
  }

  /// ViewModelStore에 viewmodel 추가하기
  @protected
  void addViewModel(BuildContext context) {
    if (viewModel == null) {
      return;
    }
    viewModelStore = context.read<ViewModelStore>();
    if (viewModelStore?.findViewModel(viewModelKey) == false) {
      viewModelStore?.addViewModel(viewModelKey, viewModel!);
    }
  }

  /// viewModel 생성
  @protected
  VM? createViewModel();

  /// appBar 텍스트 스타일
  @override
  TextStyle? getTextStyle(BuildContext context) {
    return null;
  }

  /// appBar
  @override
  Widget? getAppbar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    addViewModel(context);
    return SafeAresScaffold(
      title: getTitle(context),
      body: getBody(context),
      appBar: getAppbar(context),
      titleTextStyle: getTextStyle(context) ??
          korMedium.copyWith(
            fontSize: 18,
            color: Colors.black,
          ),
    );
  }
}
