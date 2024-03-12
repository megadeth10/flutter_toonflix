import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/design_size.dart';
import 'package:toonflix/util/util.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const BaseButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

/// 입력 필드의 clear button
Widget makeClearButton(
    {required bool visible,
    required bool enable,
    required VoidCallback callback}) {
  if (enable && visible) {
    return IconButton(
      iconSize: DesignSize.iconSize,
      onPressed: () {
        callback.call();
      },
      icon: Icon(
        Icons.cancel,
        color: Util.getColor(ColorName.baseBackground),
      ),
    );
  }
  return const SizedBox.shrink();
}
