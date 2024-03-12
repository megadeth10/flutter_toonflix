import 'package:flutter/material.dart';
import 'package:toonflix/enum/text_field_state.dart';
import 'package:toonflix/interface/text_field_interface.dart';
import 'package:toonflix/util/design_size.dart';
import 'package:toonflix/widget/button.dart';

class ShipbaesongInputFormField extends StatefulWidget {
  final double height;
  final String initText;
  final bool useInputDelay;
  final int? maxLength;
  final String hintText;
  final int maxLine;
  final bool enable;
  const ShipbaesongInputFormField({
    super.key,
    this.height = DesignSize.textFidelHeight,
    this.initText = "",
    this.useInputDelay = false,
    this.maxLength,
    this.hintText = "",
    this.maxLine = 1,
    this.enable = true,
  });

  @override
  State<ShipbaesongInputFormField> createState() =>
      ShipbaesongInputFormFieldState();
}

class ShipbaesongInputFormFieldState extends State<ShipbaesongInputFormField>
    implements BaseTextFieldInterface {
  InputFieldState _inputFieldState = InputFieldState.normal;
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _myFocusNode;
  bool _visibleClearButton = false;

  @override
  void setText(String newString) {
    _textEditingController.text = newString;
  }

  @override
  String getText() => _textEditingController.text;

  /// TODO 커서 포커스 되면 처음에 한번 리스너가 호출되는데 정상인가?
  void _textEditingListener() {
    final text = _textEditingController.text;
    print(
        '_printLatestValueInListener text field: $text (${text.characters.length})');
  }

  @override
  void requestFocus() {
    _myFocusNode.requestFocus();
  }

  @override
  void initState() {
    _textEditingController.value = TextEditingValue(text: widget.initText);
    _textEditingController.addListener(_textEditingListener);
    _myFocusNode = FocusNode();
    _setVisibleClearButton(_textEditingController.value.text.isNotEmpty);
    super.initState();
  }

  @override
  void setInputState(InputFieldState newState) {
    setState(() {
      _inputFieldState = newState;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  bool validateTextValue() {
    return true;
  }

  /// 전체 삭제 버튼 표시 여부
  void _setVisibleClearButton(bool newState) {
    if (_visibleClearButton != newState) {
      setState(() {
        _visibleClearButton = newState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color outlineColor =
        BaseTextFieldCallback.getOutlineColor(_inputFieldState);
    Color textColor = BaseTextFieldCallback.getTextColor(_inputFieldState);
    Color backgroundColor =
        BaseTextFieldCallback.getBackgroundColor(_inputFieldState);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: outlineColor),
          color: backgroundColor,
        ),
        height: widget.height,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) {
                  print('TextField validator()');
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _textEditingController,
                enabled: widget.enable,
                maxLines: widget.maxLine,
                maxLength: widget.maxLength,
                style: TextStyle(color: textColor),
                focusNode: _myFocusNode,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 15,
                    bottom: 7,
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Theme.of(context).shadowColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            makeClearButton(
              enable: widget.enable,
              visible: _visibleClearButton,
              callback: () {
                _textEditingController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
