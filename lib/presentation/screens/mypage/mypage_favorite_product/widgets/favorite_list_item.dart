import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/data/models/favorite_product/favorite_product.dart';
import 'package:flutter/material.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.favoriteProduct,
    required this.onRemove,
    required this.onTap
  });

  final FavoriteProduct favoriteProduct;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 2, right: 2,
                child: IconButton(
                  icon: const Icon(Icons.favorite, color: AppColors.errorRed),
                  onPressed: onRemove, // 찜 취소
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            favoriteProduct.entity.name,
            style: const TextStyle(
                fontFamily: 'PretendardSemiBold',
                fontSize: 14,
                color: AppColors.textMain
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                '30%', // TODO: 실제 할인율 데이터로
                style: TextStyle(
                    fontFamily: 'PretendardBold',
                    fontSize: 14,
                    color: AppColors.errorRed
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${favoriteProduct.entity.price} 원',
                style: TextStyle(
                  fontFamily: 'PretendardMedium',
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
