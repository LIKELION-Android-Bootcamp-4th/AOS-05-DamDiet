import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewRatingSection extends StatelessWidget {
  final double rating;
  final ValueChanged<double> onRatingUpdate;

  const ReviewRatingSection({
    super.key,
    required this.rating,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '별점',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'PretendardRegular',
            color: AppColors.textMain,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: onRatingUpdate,
            ),
            const SizedBox(width: 16),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardBold',
                      color: AppColors.textMain,
                    ),
                  ),
                  const TextSpan(
                    text: ' / 5',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textHint,
                      fontFamily: 'PretendardRegular',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
