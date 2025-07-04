import 'package:damdiet/util/appcolor.dart';
import 'package:flutter/material.dart';

class BottomCTAButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BottomCTAButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "PretendardSemiBold"
          ),
        ),
      ),
    );
  }
}
