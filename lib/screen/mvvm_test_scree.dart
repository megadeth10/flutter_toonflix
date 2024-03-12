import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_stateful_screen.dart';
import 'package:toonflix/screen/view/mvvm_sub_widget.dart';
import 'package:toonflix/screen/view/mvvm_sub_widget2.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/mvvm_test_viewmodel.dart';

class MVVMTestScreen extends StatefulWidget {
  const MVVMTestScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MVVMTestScreenState();
}

class _MVVMTestScreenState extends BaseStatefulScreen<MVVMTestViewModel> {
  @override
  MVVMTestViewModel createViewModel() {
    return MVVMTestViewModel(viewModelKey);
  }

  @override
  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Text(
          Util.getStringBundle(context).mvvmtest,
        ),
        MVVMSubWidget(viewModelKey: viewModelKey),
        MVVMSubWidget2(viewModelKey: viewModelKey),
      ],
    );
  }

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).mvvmtest;
  }

  @override
  void onPause() {
    printLog('onPause()');
  }

  @override
  void onResume() {
    printLog('onResume()');
  }

  @override
  String getTagName() {
    return '_MVVMTestScreenState';
  }
}
