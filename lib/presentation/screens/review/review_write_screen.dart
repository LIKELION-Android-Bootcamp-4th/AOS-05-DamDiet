import 'package:damdiet/core/widgets/bottom_cta_button.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_photo_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_product_info.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_rating_section.dart';
import 'package:damdiet/presentation/screens/review/widgets/review_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/appcolor.dart';

class ReviewWriteScreen extends StatefulWidget {
  const ReviewWriteScreen({super.key});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _attachedPhotos = ['placeholder'];
  double _rating = 4.0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
              'assets/icons/ic_arrow_back.svg', width: 24, height: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('리뷰 등록', style: TextStyle(color: AppColors.textMain, fontSize: 18, fontFamily: 'PretendardBold')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewProductInfo(),
                  const SizedBox(height: 20),

                  ReviewTextField(controller: _textController),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.gray100, height: 1,thickness: 2,),

                  const SizedBox(height: 8),
                  ReviewPhotoSection(attachedPhotos: _attachedPhotos, onAddPhoto: (){}, onRemovePhoto: (id){}),
                  const SizedBox(height: 16),
                  const Divider(height: 18, color: AppColors.gray100, thickness: 2,),

                  ReviewRatingSection(rating: _rating, onRatingUpdate: (newRating) {},),
                ],
              ),
            ),
          ),
          BottomCTAButton(text: '리뷰 등록', onPressed: (){}),
        ],
      ),
    );
  }

}