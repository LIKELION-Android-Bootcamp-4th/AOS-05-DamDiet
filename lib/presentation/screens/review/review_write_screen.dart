import 'package:damdiet/core/widgets/bottom_cta_button.dart';
import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/models/product/review_summary_product.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:damdiet/presentation/screens/review/review_write_viewmodel.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_photo_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_product_info.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_rating_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolor.dart';
import '../../../core/widgets/damdiet_appbar.dart';

class ReviewWriteArguments {
  final ReviewSummaryProduct product;
  final String orderId;

  ReviewWriteArguments({required this.product, required this.orderId});
}

class ReviewWriteScreenWithProvider extends StatelessWidget {
  const ReviewWriteScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! ReviewWriteArguments) {
      return Scaffold(
        appBar: DamdietAppbar(title: '오류', showBackButton: true),
        body: const Center(
          child: Text('리뷰를 작성할 상품 정보를 불러오지 못했습니다.'),
        ),
      );
    }
    final reviewArgs = args;

    return ChangeNotifierProvider(
      create: (_) => ReviewWriteViewModel(
        product: reviewArgs.product,
        orderId: reviewArgs.orderId,
        repository: ReviewRepository(ReviewDatasource()),
      ),
      child: const ReviewWriteScreen(),
    );
  }
}

class ReviewWriteScreen extends StatefulWidget {
  const ReviewWriteScreen({super.key});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<XFile> _images = [];
  double _rating = 5.0;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    setState(() {
      _images.addAll(pickedFiles);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ReviewWriteViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '리뷰 작성',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewProductInfo(product: viewModel.product),
            const SizedBox(height: 20),

            ReviewTextField(controller: _textController),
            const SizedBox(height: 16),
            const Divider(color: AppColors.gray100, height: 1, thickness: 2),

            const SizedBox(height: 8),
            ReviewPhotoSection(
              existingImageUrls: const [],
              newlyAddedImages: _images,
              onAddPhoto: _pickImages,
              onRemoveExisting: (index) {},
              onRemoveNew: (index) {
                setState(() {
                  _images.removeAt(index);
                });
              },
            ),
            const SizedBox(height: 16),
            const Divider(height: 18, color: AppColors.gray100, thickness: 2),

            ReviewRatingSection(
              rating: _rating,
              onRatingUpdate: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          child: BottomCTAButton(
            text: '리뷰 등록',
            onPressed: () async {
              final success = await viewModel.submitReview(
                content: _textController.text,
                rating: _rating,
                images: _images,
              );
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('리뷰가 등록되었습니다.')),
                );
                Navigator.of(context).pop();
              } else if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('리뷰 등록에 실패했습니다.')),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}