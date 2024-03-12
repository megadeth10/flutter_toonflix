import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({super.key});
  final _CounterWidgetState _widget = _CounterWidgetState();

  @override
  State<CounterWidget> createState() => _widget;

  void reset() {
    _widget.reset();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _addCount() {
    setState(() {
      ++_count;
    });
  }

  void _deleteCount() {
    setState(() {
      --_count;
    });
  }

  void reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState()");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose()");
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.titleLarge ?? const TextStyle();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Click Count',
          style: textStyle.copyWith(fontSize: 20),
        ),
        Text(
          '$_count',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _addCount,
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: _deleteCount,
              icon: const Icon(
                Icons.remove,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
