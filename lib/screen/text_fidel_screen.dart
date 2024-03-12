import 'package:flutter/material.dart';
import 'package:toonflix/enum/text_field_state.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';
import 'package:toonflix/widget/shipbaesong_inputfield.dart';
import 'package:toonflix/widget/shipbaesong_inputformfield.dart';

class TextFieldScreen extends BaseStatelessScreen {
  TextFieldScreen({super.key});
  final GlobalKey<ShipbaesongInputFieldState> _inputField1key = GlobalKey();
  final GlobalKey<ShipbaesongInputFieldState> _inputField2key = GlobalKey();
  final GlobalKey<ShipbaesongInputFormFieldState> _inputField3key = GlobalKey();

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShipbaesongInputField(
            key: _inputField1key,
            initText: "aaa",
            useInputDelay: true,
          ),
          TextButton(
            onPressed: () {
              _inputField1key.currentState!.requestFocus();
            },
            child: const Text(
              '포커스',
            ),
          ),
          TextButton(
            onPressed: () {
              print(
                  'TextFieldScreen onPressed() value: ${_inputField1key.currentState}');
              _inputField1key.currentState
                  ?.setInputState(InputFieldState.error);
            },
            child: const Text(
              'error',
            ),
          ),
          ShipbaesongInputField(
            key: _inputField2key,
            initText: "bbb",
            enable: false,
          ),
          TextButton(
            onPressed: () {
              _inputField2key.currentState!.requestFocus();
            },
            child: const Text(
              '포커스',
            ),
          ),
          ShipbaesongInputFormField(
            key: _inputField3key,
            initText: "ccc",
          ),
          TextButton(
            onPressed: () {
              _inputField3key.currentState!.requestFocus();
            },
            child: const Text(
              '포커스',
            ),
          ),
        ],
      ),
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).text_field;
  }

  @override
  String getTagName() {
    return 'TextFieldScreen';
  }
}
