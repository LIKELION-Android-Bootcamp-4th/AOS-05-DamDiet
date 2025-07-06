import 'package:damdiet/presentation/screens/product_detail/widgets/product_detail_info.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_detail_main_info.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_image.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_quantity_selector.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/Review.dart';
import '../../../core/theme/appcolor.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<Review> dummyReviews = [
    Review(
      id: '1',
      nickname: '펭귄',
      comment: '생각보다 맛있어요! 재구매 의사 있습니다.',
      rating: 5,
      images: [
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
      ],
      createdAt: DateTime.parse('2025-07-01T12:30:00Z'),
    ),
    Review(
      id: '2',
      nickname: '오리',
      comment: '양이 조금 적어요. 그래도 괜찮네요.',
      rating: 4,
      images: [
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
      ],
      createdAt: DateTime.parse('2025-07-02T15:45:00Z'),
    ),
    Review(
      id: '3',
      nickname: '햄스터',
      comment: '배송이 빨랐고 만족합니다!',
      rating: 5,
      images: null, // 사진 없음
      createdAt: DateTime.parse('2025-07-03T09:20:00Z'),
    ),
    Review(
      id: '4',
      nickname: '너구리',
      comment: '조금 아쉬웠어요. 맛이 제 취향은 아니네요.',
      rating: 3,
      images: [
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
      ],
      createdAt: DateTime.parse('2025-07-04T20:10:00Z'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/ic_arrow_back.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImage(),
                        ProductDetailMainInfo(),
                        Divider(
                          height: 6,
                          color: AppColors.gray100,
                          thickness: 6,
                        ),
                        ProductQuantitySelector(),
                        Divider(
                          height: 6,
                          color: AppColors.gray100,
                          thickness: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(),
                ),
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(child: ProductDetailInfo()),
                SingleChildScrollView(child:ProductReviewsTab(reviewList: dummyReviews,)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: const BorderSide(
                    color: AppColors.primaryColor, // 테두리 색
                    width: 1, // 테두리 두께
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/ic_heart_outline.svg',
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 2, // 비율 2
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: const Text(
                  '장바구니',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "PretendardSemiBold",
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 2, // 비율 2
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: const Text(
                  '바로구매',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "PretendardSemiBold",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade200, width: 0.5),
        ),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.textMain,
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        labelColor: AppColors.textMain,
        tabs: [
          Text(
            "상세정보",
            style: TextStyle(
              fontFamily: 'PretendardMedium',
              fontSize: 12,
              color: AppColors.textSub,
            ),
          ),
          Text(
            "리뷰",
            style: TextStyle(
              fontFamily: 'PretendardMedium',
              fontSize: 12,
              color: AppColors.textSub,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
