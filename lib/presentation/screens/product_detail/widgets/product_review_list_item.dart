import 'package:damdiet/data/models/review/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/theme/appcolor.dart';

class ProductReviewListItem extends StatelessWidget {
  const ProductReviewListItem({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    // TODO 이 처리는 다른 딴에서 하는게 더 좋을듯 util이나
    final date = '${review.createdAt.year}.${review.createdAt.month}.${review.createdAt.day}';

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      review.nickname,
                      style: TextStyle(
                        fontFamily: 'PretendardSemiBold',
                        fontSize: 14,
                        color: AppColors.textMain,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 12,
                        color: AppColors.textSub,
                      ),
                    ),
                  ],
                ),
                RatingBarIndicator(
                  rating: review.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14.0,
                  direction: Axis.horizontal,
                )
              ]),
          const SizedBox(height: 4,),
          Text(
            review.comment,
            style: TextStyle(
              fontFamily: 'PretendardRegular',
              fontSize: 14,
              color: AppColors.textMain,
            ),
          ),
          SizedBox(height: 8,),
          if(review.images != null && review.images!.isNotEmpty)
          SizedBox(
            height: 60,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: review.images!.length,
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  review.images![index],  width: 50,
                  height: 50,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },),
              ),
            ),
          )else ... [
            SizedBox(height: 50,)
          ],
          SizedBox(height: 16,),
          Divider(height: 1, color: AppColors.gray100, thickness: 1,),
        ],
      ),
    );
  }
}
