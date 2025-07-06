import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewPhotoSection extends StatelessWidget {
  final List<String> attachedPhotos;
  final VoidCallback onAddPhoto;
  final Function(int) onRemovePhoto;

  const ReviewPhotoSection({
    super.key,
    required this.attachedPhotos,
    required this.onAddPhoto,
    required this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('제품 사진을 첨부해보세요.',
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'PretendardRegular',
                color: AppColors.textMain)),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: attachedPhotos.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildAddPhotoButton();
              }
              return _buildPhotoThumbnail(index);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: onAddPhoto,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray100),
        ),
        child: const Icon(Icons.add, color: AppColors.textHint, size: 20),
      ),
    );
  }

  Widget _buildPhotoThumbnail(int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          child: Container(
            width: 80,
            height: 80,
            color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey, size: 40),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => onRemovePhoto(index),
            child: const Icon(Icons.close, color: AppColors.textMain, size: 16),
          ),
        ),
      ],
    );
  }
}
