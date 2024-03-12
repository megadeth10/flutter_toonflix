import 'package:flutter/material.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';

class CustomFontScreen extends BaseStatelessScreen {
  const CustomFontScreen({super.key});

  @override
  Widget? getAppbar(BuildContext context) {
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "abcdefg가나다라 한국어 ",
          style: biggraeBold,
        ),
        Text(
          "abcdefg가나다라 한국어 ",
          style: korBold,
        ),
        Text(
          "abcdefg가나다라 eng",
          style: engBold,
        ),
        Text(
          "abcdefg가나다라 기본 ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "abcdefg가나다라 한국어 ",
          style: korMedium,
        ),
        Text(
          "abcdefg가나다라 eng",
          style: engMedium,
        ),
        Text(
          "abcdefg가나다라 기본",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "abcdefg가나다라 한국어 ",
          style: korRegular,
        ),
        Text(
          "abcdefg가나다라 eng",
          style: engRegular,
        ),
        Text(
          "abcdefg가나다라 기본",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) {
    return null;
  }

  @override
  String getTitle(BuildContext context) {
    return '폰트 테스트';
  }

  @override
  String getTagName() {
    return 'CustomFontScreen';
  }
}
