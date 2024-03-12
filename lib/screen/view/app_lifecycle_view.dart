import 'package:flutter/material.dart';
import 'package:toonflix/warpping_widget/warpping_app_lifecycle_statefulwidget.dart';

class AppLifecycleView extends StatefulWidget {
  const AppLifecycleView({super.key});

  @override
  State<AppLifecycleView> createState() => _AppLifecycleViewState();
}

class _AppLifecycleViewState extends AppLifecycleWidget<AppLifecycleView> {
  @override
  void onPause() {}

  @override
  void onResume() {}

  @override
  void initState() {
    super.initState();
    addObserver();
  }

  @override
  void dispose() {
    removeObserver();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (appLifecycleState == null) {
      return const Text(
        'This widget has not observed any lifecycle changes.',
        textDirection: TextDirection.ltr,
      );
    }

    return Text(
      'The most recent lifecycle state this widget observed was: $appLifecycleState.',
      textDirection: TextDirection.ltr,
    );
  }
}

// class _AppLifecycleViewState extends State<AppLifecycleView>
//     with WidgetsBindingObserver {
//   AppLifecycleState? _lastLifecycleState;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     print(state);
//     setState(() {
//       _lastLifecycleState = state;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_lastLifecycleState == null) {
//       return const Text(
//         'This widget has not observed any lifecycle changes.',
//         textDirection: TextDirection.ltr,
//       );
//     }

//     return Text(
//       'The most recent lifecycle state this widget observed was: $_lastLifecycleState.',
//       textDirection: TextDirection.ltr,
//     );
//   }
// }
