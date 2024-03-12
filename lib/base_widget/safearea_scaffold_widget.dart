import 'package:flutter/material.dart';
import 'package:toonflix/widget/favorite_appbar.dart';

/// SafeArea를 이용하여 StatusBar 영역을 사용하지 않도록 Wrapping class임.
class SafeAresScaffold extends StatelessWidget {
  final Widget? _appBar;
  final String? _title;
  final TextStyle? _titletextStyle;
  final Widget _body;
  const SafeAresScaffold({
    super.key,
    title,
    body,
    titleTextStyle,
    appBar,
  })  : _body = body,
        _title = title,
        _titletextStyle = titleTextStyle,
        _appBar = appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ..._getAppBar(),
            Expanded(
              child: _body,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getAppBar() {
    List<Widget> returnWidget = [];
    if (_appBar != null) {
      returnWidget.add(_appBar);
    } else if (_appBar == null && _title != null) {
      returnWidget.add(
        makeAppBar(
          title: _title,
          style: _titletextStyle,
        ),
      );
    }

    return returnWidget;
  }
}
