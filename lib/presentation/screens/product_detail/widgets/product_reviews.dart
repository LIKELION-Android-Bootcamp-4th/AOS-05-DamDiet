import 'package:damdiet/presentation/screens/product_detail/widgets/product_review_list_item.dart';
import 'package:flutter/material.dart';

import '../../../../models/Review.dart';
import '../../../../core/theme/appcolor.dart';

class ProductReviewsTab extends StatelessWidget {
  const ProductReviewsTab({super.key, required this.reviewList});

  final List<Review> reviewList;

  @override
  Widget build(BuildContext context) {
    //reviewList.clear();

    final List<String> allReviewImages = reviewList
        .where((review) => review.images != null)
        .expand((review) => review.images!)
        .toList();



    return Container(
      padding: EdgeInsets.only(),
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16, right: 16.0),
              child: Column(
                children: [
                  if (reviewList.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64.0),
                      child: Text(
                        '해당 상품에 등록된 리뷰가 없습니다.',
                        style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 12,
                          color: AppColors.textSub,
                        ),
                      ),
                    )
                  else ...[
                    const Text(
                      '상품 만족도',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 14,
                        color: AppColors.textMain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.highlightYellowDark,
                          size: 26,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '5.0',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'PretendardBold',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '/ 5',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 16,
                              fontFamily: 'PretendardRegular',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          reviewList.length.toString(),
                          style: TextStyle(
                            fontFamily: 'PretendardSemiBold',
                            fontSize: 14,
                            color: AppColors.textMain,
                          ),
                        ),
                        Text(
                          ' 개의 리뷰가 있습니다.',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 12,
                            color: AppColors.textSub,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1, color: AppColors.gray100),
                  ],
                ],
              ),
            ),

            // TODO: 현재는 리뷰 리스트 엠티 검사를 하는데 ImageList 로 검사해서 else 문도 작성 해야함
            if (reviewList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: allReviewImages.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final imageUrl = allReviewImages[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
            Divider(height: 6, color: AppColors.gray100, thickness: 6,),
            if(reviewList.isNotEmpty)
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                itemCount: reviewList.length,
                  itemBuilder: (context,index) {
                    final review = reviewList[index];
                    return ProductReviewListItem(review: review);
                  }
              ),
          ],
        ),
      ),
    );
  }
}
