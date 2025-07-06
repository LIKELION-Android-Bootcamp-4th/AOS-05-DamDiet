import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/appcolor.dart';

class ReviewEditScreen extends StatefulWidget {
  const ReviewEditScreen({super.key});

  @override
  State<ReviewEditScreen> createState() => _ReviewEditScreenState();
}

class _ReviewEditScreenState extends State<ReviewEditScreen> {
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
        title: const Text('리뷰 수정', style: TextStyle(color: AppColors.textMain, fontSize: 18, fontFamily: 'PretendardBold')),
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
                  _buildProductInfo(),
                  const SizedBox(height: 20),

                  _buildReviewTextField(),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.gray100, height: 1,thickness: 2,),

                  const SizedBox(height: 8),
                  _buildPhotoAttachmentSection(),
                  const SizedBox(height: 16),
                  const Divider(height: 18, color: AppColors.gray100, thickness: 2,),

                  _buildRatingSection(),
                ],
              ),
            ),
          ),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildProductInfo() {
    return Row(
      children: [
        ClipRRect(
          child: Container(
            width: 100, height: 100, color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey, size: 40),
          ),
        ),
        const SizedBox(width: 14),
        SizedBox(
          height: 100,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('담다잇 닭가슴살', style: TextStyle(fontSize: 16, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
              Text('불닭치즈 맛', style: TextStyle(fontSize: 14, color: AppColors.textSub, fontFamily: 'PretendardRegular')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewTextField() {
    return TextField(
      maxLines: 9,
      decoration: InputDecoration(
          hintText: '리뷰를 작성하세요.',
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14, fontFamily: 'PretendardRegular'),
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: AppColors.gray100,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5),),
          )
      ),
    );
  }

  Widget _buildPhotoAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('제품 사진을 첨부해보세요.', style: TextStyle(fontSize: 14, fontFamily: 'PretendardRegular', color: AppColors.textMain)),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _attachedPhotos.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildAddPhotoButton();
              }
              return _buildPhotoThumbnail();
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: () { /* TODO: 이미지 선택 */ },
      child: Container(
        width: 70, height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray100),
        ),
        child: const Icon(Icons.add, color: AppColors.textHint, size: 20),
      ),
    );
  }

  Widget _buildPhotoThumbnail() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          child: Container(
            width: 80, height: 80, color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey, size: 40),
          ),
        ),
        Positioned(
          top: 4, right: 4,
          child: GestureDetector(
            onTap: () { /* TODO : 사진 삭제 */ },
            child: Container(
              child: const Icon(Icons.close, color: AppColors.textMain, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('별점', style: TextStyle(fontSize: 14, fontFamily: 'PretendardRegular', color: AppColors.textMain)),
        const SizedBox(height: 12),
        Row(
          children: [
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(width: 16),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: _rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 16, fontFamily: 'PretendardBold', color: AppColors.textMain)
                      ),
                      const TextSpan(
                          text: ' / 5',
                          style: TextStyle(fontSize: 16, color: AppColors.textHint, fontFamily: 'PretendardRegular')
                      ),
                    ]
                )
            )
          ],
        )
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(26, 12, 26, 30),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {/* TODO: 리뷰 등록 */ },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text('수정하기', style: TextStyle(fontSize: 16, fontFamily: 'PretendardSemiBold', )),
      ),
    );
  }
}