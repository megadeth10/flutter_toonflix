import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_stateful_screen.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/main_view_model.dart';

/// 메인화면
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends BaseStatefulScreen<MainViewModel> {
  @override
  MainViewModel? createViewModel() {
    return MainViewModel(viewModelKey);
  }

  @override
  Widget getBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Util.getColor(ColorName.white),
      ),
      child: const Column(
        children: [
          Text('main'),
        ],
      ),
    );
  }

  @override
  String getTagName() {
    return '_MainScreenState';
  }

  @override
  String? getTitle(BuildContext context) => null;

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }
}
