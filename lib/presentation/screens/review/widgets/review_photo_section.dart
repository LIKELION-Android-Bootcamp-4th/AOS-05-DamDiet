import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewPhotoSection extends StatelessWidget {
  final List<String> existingImageUrls;
  final List<XFile> newlyAddedImages;
  final VoidCallback onAddPhoto;
  final Function(int) onRemoveExisting;
  final Function(int) onRemoveNew;

  const ReviewPhotoSection({
    super.key,
    required this.existingImageUrls,
    required this.newlyAddedImages,
    required this.onAddPhoto,
    required this.onRemoveExisting,
    required this.onRemoveNew,
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
                color: AppColors.textMain)
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 1 + existingImageUrls.length + newlyAddedImages.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                if (existingImageUrls.length + newlyAddedImages.length < 5) {
                  return _buildAddPhotoButton();
                } else {
                  return const SizedBox.shrink();
                }
              }
              int existingImageIndex = index - 1;
              if (existingImageIndex < existingImageUrls.length) {
                // 기존 이미지
                return _buildPhotoThumbnail(
                  onRemove: () => onRemoveExisting(existingImageIndex),
                  child: Image.network(
                    existingImageUrls[existingImageIndex],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                );
              }

              int newImageIndex = index - 1 - existingImageUrls.length;
              if (newImageIndex < newlyAddedImages.length) {
                // 추가한 이미지
                return _buildPhotoThumbnail(
                  onRemove: () => onRemoveNew(newImageIndex),
                  child: Image.file(
                    File(newlyAddedImages[newImageIndex].path),
                    fit: BoxFit.cover,
                  ),
                );
              }
              return const SizedBox.shrink();
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
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray200),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, color: AppColors.textHint, size: 24),
            SizedBox(height: 4),
            Text("사진 추가", style: TextStyle(fontSize: 12, color: AppColors.textHint)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoThumbnail({
    required Widget child,
    required VoidCallback onRemove,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            width: 80,
            height: 80,
            child: child,
          ),
        ),
        Positioned(
          top: -4,
          right: -4,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
