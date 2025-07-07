import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;


  const UnderlineText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final textPainter = TextPainter(
          text: TextSpan(text: text, style: textStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout();

        final textWidth = textPainter.size.width;

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            // 밑줄 Container
            Positioned(
              bottom: 3,
              child: Container(
                height: 6,
                width: textWidth + 2,
                color: AppColors.highlightYellowDark,
              ),
            ),
            // 텍스트
            Text(
              text,
              style: textStyle
            ),
          ],
        );
      },
    );
  }
}
