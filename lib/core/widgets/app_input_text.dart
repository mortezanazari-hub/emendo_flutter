import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class AppInputText extends StatefulWidget {
  final bool isPassword;
  final bool isError;
  final ValueChanged<String> onChanged;

  final String title;
  final String hint;
  final IconData icon;

  const AppInputText({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.isError = false,
    required this.onChanged,
  });

  @override
  _AppInputTextState createState() => _AppInputTextState();
}

class _AppInputTextState extends State<AppInputText> {
  late bool _isPassword;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  String _textValue = ""; // Track the current text value

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
           SizedBox(height: AppConst.standardPadding *.1),
          TextField(
            focusNode: _focusNode,
            obscureText: _isPassword,
            onChanged: (value) {
              setState(() {
                _textValue = value;
              });
              widget.onChanged(value);
            },
            onSubmitted: (value) {
              // Handle submitted value if needed
            },
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(
                  color: AppConst.disabledColor, fontWeight: FontWeight.w300),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: _isFocused
                    ? BorderSide(
                        color: _isFocused || widget.isError
                            ? AppConst.mainColor
                            : AppConst.disabledColor,
                        width: 2)
                    : BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                widget.icon,
                size: 28,
                weight: 0.1,
                color: _textValue.isNotEmpty // Condition for icon color
                    ? AppConst.mainColor
                    : (_isFocused || widget.isError)
                        ? AppConst.mainColor
                        : AppConst.disabledColor,
              ),
              suffix: widget.isPassword
                  ? GestureDetector(
                      child:  Icon(
                       _isPassword? Icons.remove_red_eye_outlined :Icons.remove_red_eye,
                        color: AppConst.disabledColor,
                      ),
                      onTap: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                    )
                  : null,
              filled: false,
              fillColor: _isFocused || widget.isError
                  ? Colors.green.withOpacity(0.1)
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.isPassword == false
        ? _isPassword = false
        : _isPassword = widget.isPassword;
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
