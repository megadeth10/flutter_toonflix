import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/interface/view_model_interface.dart';
import 'package:toonflix/store/view_model_store.dart';
import 'package:toonflix/warpping_widget/warpping_app_lifecycle_statefulwidget.dart';

/// ViewModel을 공유하기 위한 StatelessWidget 추상 객체
abstract class BaseSubStatelessWidget<VM extends BaseViewModel>
    extends StatelessWidget implements SubWidgetWithViewModelCallback<VM> {
  @protected
  final GlobalKey? viewModelKey;

  const BaseSubStatelessWidget({
    super.key,
    required this.viewModelKey,
  });

  @override
  VM? getViewModel(BuildContext context) {
    if (viewModelKey != null) {
      final viewModelStore = context.read<ViewModelStore>();
      return viewModelStore.getViewModel(viewModelKey!) as VM?;
    }
    return null;
  }
}

/// ViewModel을 공유하기 위한 BaseSubStatefulWidget 추상 객체
/// viewModelKey값을 warpping함
abstract class BaseSubStatefulWidget extends StatefulWidget {
  @protected
  final GlobalKey? viewModelKey;
  const BaseSubStatefulWidget({
    super.key,
    this.viewModelKey,
  });
}

/// ViewModel을 공유하기 위한 BaseSubState 추상 객체
abstract class BaseSubState<VM extends BaseViewModel,
        SW extends BaseSubStatefulWidget> extends AppLifecycleWidget<SW>
    with LogCallback
    implements SubWidgetWithViewModelCallback<VM> {
  @protected
  late String tag = "";

  @protected
  late VM? viewModel;

  @override
  void initState() {
    super.initState();
    addObserver();
    tag = getTagName();
    getViewModel(context);
  }

  @override
  void dispose() {
    super.dispose();
    removeObserver();
  }

  @override
  void getViewModel(BuildContext context) {
    if (widget.viewModelKey != null) {
      final viewModelStore = context.read<ViewModelStore>();
      viewModel = viewModelStore.getViewModel(widget.viewModelKey!) as VM;
    }
  }
}

/// viewmodel 생성 함수 정의함.
abstract class SubWidgetWithViewModelCallback<VM extends BaseViewModel> {
  @protected
  void getViewModel(BuildContext context);
}
