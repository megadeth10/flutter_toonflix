import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_sub_widget.dart';
import 'package:toonflix/view_model/mvvm_test_viewmodel.dart';

class MVVMSubWidget extends BaseSubStatelessWidget<MVVMTestViewModel> {
  const MVVMSubWidget({super.key, required super.viewModelKey});

  @override
  Widget build(BuildContext context) {
    final viewModel = getViewModel(context);
    return Column(
      children: [
        Text(viewModel?.value.toString() ?? "0"),
        TextButton(
          onPressed: () {
            print('MVVMSubWidget');
            viewModel?.call();
          },
          child: const Text(
            'MVVMSubWidget 가산',
          ),
        )
      ],
    );
  }
}
