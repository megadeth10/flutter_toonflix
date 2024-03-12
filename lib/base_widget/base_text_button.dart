import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_sub_widget.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/design_size.dart';
import 'package:toonflix/util/util.dart';

class BaseTextButton extends BaseSubStatelessWidget {
  final String name;
  final bool isOutLine;
  final Color? color;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  const BaseTextButton(
      {super.key,
      super.viewModelKey,
      required this.name,
      required this.onPressed,
      this.color,
      this.width,
      this.height = DesignSize.buttonHeight,
      this.isOutLine = false});

  @override
  Widget build(BuildContext context) {
    final otherColor = Util.getColor(ColorName.white);
    final mainColor = color ?? Util.getColor(ColorName.primaryBlue);
    Color fillColor = mainColor;
    Color outlineColor = mainColor;
    Color textColor = otherColor;
    if (isOutLine) {
      textColor = mainColor;
      fillColor = otherColor;
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(
          color: outlineColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(
          height! / 2,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: korRegular.copyWith(
                fontSize: 14,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
