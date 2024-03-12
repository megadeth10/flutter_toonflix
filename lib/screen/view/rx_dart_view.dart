import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toonflix/util/const_values.dart';

class RxDartView extends StatefulWidget {
  const RxDartView({super.key});

  @override
  State<RxDartView> createState() => _RxDartViewState();
}

class _RxDartViewState extends State<RxDartView> {
  final TextEditingController _controller = TextEditingController();
  late BehaviorSubject<String> _textSubject;

  @override
  void initState() {
    super.initState();
    _textSubject = BehaviorSubject<String>();
    _textSubject
        .debounceTime(Duration(seconds: ConstValue.inputDelayTimeBySecond))
        .listen((text) {
      // 입력이 3초간 없을 때 호출되는 함수
      print(
          'User input after ${ConstValue.inputDelayTimeBySecond} seconds: $text');
      // 여기서 원하는 작업을 수행할 수 있습니다.
    });
  }

  @override
  void dispose() {
    _textSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxDart TextField Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _controller,
            onChanged: (text) {
              _textSubject.add(text);
            },
            decoration: const InputDecoration(
              hintText: 'Type something...',
            ),
          ),
        ),
      ),
    );
  }
}
