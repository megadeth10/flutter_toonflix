import 'package:flutter/material.dart';
import 'package:toonflix/enum/text_field_state.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/util.dart';

/// 입력 필드에 기본 함수 정의
abstract class BaseTextFieldInterface {
  /// TextEditingController의 String value 값
  @protected
  String getText();

  /// 텍스트 설정
  @protected
  void setText(String newString);

  /// 입력필드 커서 포커싱
  @protected
  void requestFocus();

  /// 입력 필드 상태값 InputFieldState
  @protected
  void setInputState(InputFieldState newState);

  /// 입력된 데이터 유효성 확인
  @protected
  bool validateTextValue();
}

class BaseTextFieldCallback {
  /// 윤과선 색 확인
  static Color getOutlineColor(InputFieldState state) {
    Color color = Util.getColor(ColorName.black333333);
    switch (state) {
      case InputFieldState.error:
        {
          color = Util.getColor(ColorName.redE52528);
        }
      case InputFieldState.disable:
        {
          color = Util.getColor(ColorName.gray999999);
        }
      case InputFieldState.focus:
        {
          color = Util.getColor(ColorName.primaryBlue);
        }
      default:
        {}
    }
    return color;
  }

  /// 텍스트 색
  static Color getTextColor(InputFieldState state) {
    Color color = Util.getColor(ColorName.black333333);
    switch (state) {
      case InputFieldState.disable:
        {
          color = Util.getColor(ColorName.gray999999);
        }
      default:
        {}
    }
    return color;
  }

  /// 바탕색
  static Color getBackgroundColor(InputFieldState state) {
    Color color = Util.getColor(ColorName.white);
    switch (state) {
      case InputFieldState.disable:
        {
          color = Util.getColor(ColorName.grayF9F9F9);
        }
      default:
        {}
    }
    return color;
  }
}
