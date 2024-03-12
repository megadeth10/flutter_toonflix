import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toonflix/store/user_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserStore userStore = UserStore();
  final _maxTimer = 1500;
  late int _timeValue;
  late Timer _timer;
  final timeInSecond = 60;
  bool _isRunning = false;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _setMainValue();
  }

  void _setMainValue() {
    _timeValue = _maxTimer;
  }

  void _addCounter() {
    setState(() {
      ++_counter;
    });
  }

  void _onTick(Timer timer) {
    print("onTick()");
    setState(() {
      --_timeValue;
      if (_timeValue < 0) {
        _timeValue = _maxTimer;
        _addCounter();
      }
    });
  }

  void _toggleRunning(bool newState) {
    setState(() {
      _isRunning = newState;
    });
  }

  void _startTimer() {
    if (!_isRunning) {
      _toggleRunning(true);
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        _onTick,
      );
    }
  }

  void _pauseTimer() {
    _stopRunning();
  }

  void _stopTimer() {
    _stopRunning();
    _setMainValue();
  }

  /*
   * 타이머 정지와 동작상태 정지로 설정
   */
  void _stopRunning() {
    if (_isRunning) {
      _toggleRunning(false);
      _timer.cancel();
    }
  }

  String _displayTime() {
    var formatter = DateFormat('mm : ss');
    DateTime date = DateTime(0, 0, 0, 0, 0, _timeValue);
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                _displayTime(),
                style: TextStyle(
                  fontSize: 100,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 100,
                    icon: Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: _isRunning ? _pauseTimer : _startTimer,
                    disabledColor: Theme.of(context).cardColor.withOpacity(0.8),
                  ),
                  IconButton(
                    iconSize: 100,
                    icon: Icon(
                      Icons.stop,
                      color: _isRunning
                          ? Theme.of(context).cardColor
                          : Theme.of(context).cardColor.withOpacity(0.3),
                    ),
                    onPressed: _isRunning ? _stopTimer : () {},
                    disabledColor: Theme.of(context).cardColor.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "pomodors",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.color ??
                                  Colors.black),
                        ),
                        Text(
                          "$_counter",
                          style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.color ??
                                  Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
