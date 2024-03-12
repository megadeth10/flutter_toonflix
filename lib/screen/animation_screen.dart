import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toonflix/screen/view/logo_animation_widget.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class AnimationScreen extends BaseStatelessScreen {
  const AnimationScreen({super.key});

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: LogoAnimationWidget(),
        ),
        SizedBox(
          height: 20,
          child: _getBottomLogo(context),
        ),
      ],
    );
  }

  Widget _getBottomLogo(BuildContext context) {
    var formatter = DateFormat('yyyy');
    final currentTime = DateTime.now();
    final year = formatter.format(currentTime);
    final format = Util.getStringBundle(context).application_copyright;
    return Text(
      format.replaceAll("///", year),
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).animation_test;
  }

  @override
  String getTagName() {
    return 'AnimationScreen';
  }
}
