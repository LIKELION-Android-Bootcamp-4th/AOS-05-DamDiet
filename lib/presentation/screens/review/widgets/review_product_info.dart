import 'package:damdiet/data/models/product/review_summary_product.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewProductInfo extends StatelessWidget {
  final ReviewSummaryProduct product;

  const ReviewProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: Container(
            width: 100,
            height: 100,
            color: AppColors.gray100,
            child: product.thumbnailImageUrl != null
                ? Image.network(
                    product.thumbnailImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.grey, size: 40),
                  )
                : const Icon(Icons.image, color: Colors.grey, size: 40),
          ),
        ),
        const SizedBox(width: 14),

        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'PretendardSemiBold',
              color: AppColors.textMain,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
