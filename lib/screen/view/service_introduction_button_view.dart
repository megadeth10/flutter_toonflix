import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_sub_widget.dart';
import 'package:toonflix/base_widget/base_text_button.dart';
import 'package:toonflix/util/util.dart';

class ServiceIntroductionButtonView extends BaseSubStatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onSignup;
  const ServiceIntroductionButtonView({
    super.key,
    required super.viewModelKey,
    this.onLogin,
    this.onSignup,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 148,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BaseTextButton(
              name: Util.getStringBundle(context).login,
              onPressed: onLogin,
            ),
            const SizedBox(
              height: 16,
            ),
            BaseTextButton(
              name: Util.getStringBundle(context).sign_up,
              isOutLine: true,
              onPressed: onSignup,
            ),
          ],
        ),
      ),
    );
  }
}
