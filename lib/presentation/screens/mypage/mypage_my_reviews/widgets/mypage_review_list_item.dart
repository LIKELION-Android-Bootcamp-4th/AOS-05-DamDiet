import 'package:damdiet/data/models/review/my_review.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/theme/appcolor.dart';
import '../../../../../core/widgets/confirm_dialog.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../../../core/widgets/underline_text.dart';

class MypageReviewListItem extends StatelessWidget {
  const MypageReviewListItem({
    super.key,
    required this.myReview,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final MyReview myReview;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    // TODO 이 처리는 다른 딴에서 하는게 더 좋을듯 util이나
    // TODO 수정일, 생성일 처리
    final date =
        '${myReview.createdAt.year}.${myReview.createdAt.month}.${myReview.createdAt.day}';

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: UnderlineText(
                  text: myReview.product.name,
                  textStyle: TextStyle(
                    fontFamily: 'PretendardSemiBold',
                    fontSize: 16,
                    color: AppColors.textMain,
                  ),
                ),
              ),
              SizedBox(width: 8),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_horiz, color: AppColors.textSub),
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      onTapEdit();
                      break;
                    case 'delete':
                      showDialog(
                        context: context,
                        builder: (context) => ConfirmDialog(
                          title: '해당 리뷰를 삭제하시겠습니까?',
                          content: '삭제된 리뷰는 복구할 수 없습니다.',
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          onConfirm: () {
                            Navigator.of(context).pop();
                            onTapDelete();
                          },
                        ),
                      );
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<String>(
                    height: 32,
                    value: 'edit',
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '수정하기',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 12,
                        color: AppColors.textSub,
                      ),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    height: 32,
                    value: 'delete',
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '삭제하기',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 12,
                        color: AppColors.textSub,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 12,
                  color: AppColors.textSub,
                ),
              ),
              RatingBarIndicator(
                rating: myReview.rating.toDouble(),
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 14.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            myReview.content,
            style: TextStyle(
              fontFamily: 'PretendardRegular',
              fontSize: 12,
              color: AppColors.textMain,
            ),
          ),
          SizedBox(height: 8),
          if (myReview.images != null && myReview.images!.isNotEmpty)
            SizedBox(
              height: 60,
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: myReview.images!.length,
                separatorBuilder: (_, __) => SizedBox(width: 10),
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CommonNetworkImage(
                    url: myReview.images![index].url,
                    size: 50,
                  ),
                ),
              ),
            )
          else ...[
            SizedBox(height: 30),
          ],
          SizedBox(height: 16),
          Divider(height: 1, color: AppColors.gray100, thickness: 1),
        ],
      ),
    );
  }
}
