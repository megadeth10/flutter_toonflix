import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_sub_widget.dart';
import 'package:toonflix/view_model/mvvm_test_viewmodel.dart';

class MVVMSubWidget2 extends BaseSubStatefulWidget {
  const MVVMSubWidget2({super.key, required super.viewModelKey});

  @override
  State<MVVMSubWidget2> createState() => _MVVMSubState();
}

class _MVVMSubState extends BaseSubState<MVVMTestViewModel, MVVMSubWidget2> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = viewModel?.value ?? 0;
  }

  void setValue() {
    setState(() {
      _value = _value + 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewModel?.value = _value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_value.toString()),
        TextButton(
          onPressed: () {
            setValue();
          },
          child: const Text(
            'MVVMSubWidget2 가산',
          ),
        ),
        Text(viewModel?.value.toString() ?? "0"),
        TextButton(
          onPressed: () {
            print('MVVMSubWidget2');
            viewModel?.call();
          },
          child: const Text(
            'MVVMSubWidget2 확인',
          ),
        ),
      ],
    );
  }

  @override
  void onPause() {
    print('$tag onPause()');
  }

  @override
  void onResume() {
    print('$tag onResume()');
  }

  @override
  String getTagName() {
    return '_MVVMSubState';
  }
}
