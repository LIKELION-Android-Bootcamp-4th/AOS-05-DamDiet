import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: widget.isPassword ? _obscureText : false,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        filled: widget.readOnly,
        fillColor: widget.readOnly ? AppColors.gray100 : null,
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.textHint,
          fontSize: 14,
          fontFamily: 'PretendardLight',
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textHint, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : (!widget.readOnly && _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      onPressed: () {
                        _controller.clear();
                        widget.onChanged?.call('');
                        setState(() {});
                      },
                    )
                  : null),
      ),
      cursorColor: AppColors.primaryColor,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
    );
  }
}
