import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
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
      decoration: InputDecoration(
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
            : (_controller.text.isNotEmpty
            ? IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.blueAccent,
            size: 20,
          ),
          onPressed: () {
            _controller.clear();
            setState(() {});
          },
        )
            : null),
      ),
      cursorColor: AppColors.primaryColor,
      onChanged: (_) => setState(() {}),
    );
  }
}
