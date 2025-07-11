import 'package:damdiet/core/widgets/bottom_cta_button.dart';
import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/models/review/my_review.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_edit_viewmodel.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_photo_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_product_info.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_rating_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolor.dart';
import '../../../core/widgets/damdiet_appbar.dart';

class ReviewEditScreen extends StatelessWidget {
  const ReviewEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final review = ModalRoute.of(context)!.settings.arguments as MyReview;

    return ChangeNotifierProvider(
      create: (_) => ReviewEditViewModel(
        ReviewRepository(ReviewDatasource()),
        review,
      ),
      child: const ReviewEditView(),
    );
  }
}

class ReviewEditView extends StatefulWidget {
  const ReviewEditView({super.key});

  @override
  State<ReviewEditView> createState() => _ReviewEditViewState();
}

class _ReviewEditViewState extends State<ReviewEditView> {
  late final TextEditingController _textController;
  late double _currentRating;
  late List<String> _existingImageUrls;
  final List<XFile> _newlyAddedImages = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final initialReview = context.read<ReviewEditViewModel>().review;
    _textController = TextEditingController(text: initialReview.content);
    _currentRating = initialReview.rating.toDouble();
    _existingImageUrls  = List<String>.from(initialReview.images ?? []);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    setState(() {
      _newlyAddedImages.addAll(pickedFiles);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ReviewEditViewModel>();

    if (viewModel.review != null && _textController.text.isEmpty) {
      _textController.text = viewModel.review!.content;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '리뷰 수정',
        showBackButton: true,
      ),
      body: _buildBody(viewModel),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          child: BottomCTAButton(
            text: '리뷰 수정',
            onPressed: () async {
              final keepImageIds = _existingImageUrls
                  .map((url) => url.split('/').last.split('.').first)
                  .toList();
              final success = await viewModel.updateReview(
                content: _textController.text,
                rating: _currentRating,
                keepImageIds: keepImageIds,
                newImages: _newlyAddedImages,
              );
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('리뷰가 성공적으로 수정되었습니다.')),
                );
                Navigator.of(context).pop(true);
              } else if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('리뷰 수정에 실패했습니다.')),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(ReviewEditViewModel viewModel) {
    final review = viewModel.review;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewProductInfo(product: review.product),
          const SizedBox(height: 20),

          ReviewTextField(controller: _textController),
          const SizedBox(height: 16),
          const Divider(color: AppColors.gray100, height: 1, thickness: 2),

          const SizedBox(height: 8),
          ReviewPhotoSection(
            existingImageUrls: _existingImageUrls,
            newlyAddedImages: _newlyAddedImages,
            onAddPhoto: _pickImages,
            onRemoveExisting: (index) {
              setState(() {
                _existingImageUrls.removeAt(index);
              });
            },
            onRemoveNew: (index) {
              setState(() {
                _newlyAddedImages.removeAt(index);
              });
            },
          ),
          const SizedBox(height: 16),
          const Divider(height: 18, color: AppColors.gray100, thickness: 2),

          ReviewRatingSection(
            rating: _currentRating,
            onRatingUpdate: (newRating) {
              setState(() {
                _currentRating = newRating;
              });
            },
          ),
        ],
      ),
    );
  }

}