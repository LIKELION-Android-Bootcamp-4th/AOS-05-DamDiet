import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/core/widgets/network_image.dart';
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
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
                  child:
                  Image.network(
                    favoriteProduct.entity.thumbnailImageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
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
