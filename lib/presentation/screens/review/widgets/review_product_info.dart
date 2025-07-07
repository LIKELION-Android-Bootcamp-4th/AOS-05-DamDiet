import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewProductInfo extends StatelessWidget {
  const ReviewProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Container(
            width: 100,
            height: 100,
            color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey, size: 40),
          ),
        ),
        const SizedBox(width: 14),
        const SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('담다잇 닭가슴살',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardSemiBold',
                      color: AppColors.textMain)),
              Text('불닭치즈 맛',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSub,
                      fontFamily: 'PretendardRegular')),
            ],
          ),
        ),
      ],
    );
  }
}
