import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toonflix/enum/text_field_state.dart';
import 'package:toonflix/interface/text_field_interface.dart';
import 'package:toonflix/util/const_values.dart';
import 'package:toonflix/util/design_size.dart';
import 'package:toonflix/widget/button.dart';

// typedef StringCallback = void Function(String text);

class ShipbaesongInputField extends StatefulWidget {
  final double height;
  final String initText;
  final bool useInputDelay;
  final int? maxLength;
  final String hintText;
  final int maxLine;
  final bool enable;
  const ShipbaesongInputField({
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
  State<ShipbaesongInputField> createState() => ShipbaesongInputFieldState();
}

class ShipbaesongInputFieldState extends State<ShipbaesongInputField>
    implements BaseTextFieldInterface {
  InputFieldState _inputFieldState = InputFieldState.normal;
  final TextEditingController _textEditingController = TextEditingController();
  BehaviorSubject<String>? _textSubject;
  late FocusNode _myFocusNode;
  bool _visibleClearButton = false;
  // ValueChanged<String>? _onChanged;

  @override
  void initState() {
    _textEditingController.value = TextEditingValue(text: widget.initText);
    _textEditingController.addListener(_textEditingListener);
    if (widget.useInputDelay) {
      _initInputBehavior();
      // _onChanged = null;
    } else {
      // _onChanged = _onChangedCallback;
    }
    _setVisibleClearButton(_textEditingController.value.text.isNotEmpty);
    _initFocusNode();
    _initInputState();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _disposeInputBehavior();
    _myFocusNode.removeListener(_focusListener);
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  void setText(String newString) {
    _textEditingController.text = newString;
  }

  @override
  String getText() => _textEditingController.text;

  /// TODO 커서 포커스 되면 처음에 한번 리스너가 호출되는데 정상인가?
  void _textEditingListener() {
    final text = _textEditingController.text;
    _focusListener();
    _setVisibleClearButton(text.isNotEmpty);
    print('_textEditingListener text field: $text (${text.characters.length})');
    if (widget.useInputDelay && _textSubject != null) {
      _textSubject!.add(text);
    }
  }

  // void _onChangedCallback(String text) {
  //   print('_onChangedCallback text field: $text (${text.characters.length})');
  // }

  @override
  void requestFocus() {
    if (widget.enable) {
      _myFocusNode.requestFocus();
    }
  }

  /// 입력 딜레이 subject 초기화
  void _initInputBehavior() {
    _textSubject = BehaviorSubject<String>();
    _textSubject!
        .debounceTime(Duration(seconds: ConstValue.inputDelayTimeBySecond))
        .listen((text) {
      // 입력이 3초간 없을 때 호출되는 함수
      _delayInputCallback(text);
      // 여기서 원하는 작업을 수행할 수 있습니다.
    });
  }

  /// focusNode 리스너 등록
  void _initFocusNode() {
    _myFocusNode = FocusNode();
    _myFocusNode.addListener(_focusListener);
  }

  /// focus가 될때 상태값 변경을 위한 리스너
  void _focusListener() {
    _initInputState();
  }

  /// subject 종료
  void _disposeInputBehavior() {
    _textSubject?.close();
  }

  /// delay subject 호출 함수
  void _delayInputCallback(String text) {
    print(
        '_delayInputCallback ${ConstValue.inputDelayTimeBySecond} seconds: $text');
  }

  /// 초기에 상태값 정의함.
  void _initInputState() {
    InputFieldState state = InputFieldState.normal;
    if (widget.enable) {
      if (_myFocusNode.hasFocus) {
        state = InputFieldState.focus;
      }
    } else {
      state = InputFieldState.disable;
    }
    setInputState(state);
  }

  @override
  void setInputState(InputFieldState newState) {
    setState(() {
      _inputFieldState = newState;
    });
  }

  /// 전체 삭제 버튼 표시 여부
  void _setVisibleClearButton(bool newState) {
    print("_setVisibleClearButton state: $newState");
    if (_visibleClearButton != newState) {
      setState(() {
        _visibleClearButton = newState;
      });
    }
  }

  @override
  bool validateTextValue() {
    return true;
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
              child: TextField(
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
