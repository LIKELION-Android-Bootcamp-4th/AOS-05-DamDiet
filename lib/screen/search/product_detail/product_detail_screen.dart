import 'package:damdiet/screen/search/product_detail/widgets/product_detail_info.dart';
import 'package:damdiet/screen/search/product_detail/widgets/product_detail_main_info.dart';
import 'package:damdiet/screen/search/product_detail/widgets/product_image.dart';
import 'package:damdiet/screen/search/product_detail/widgets/product_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_routes.dart';
import '../../../util/appcolor.dart';
import '../../../widgets/underline_text.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
                            height: 6, color: AppColors.gray100, thickness: 6),
                        ProductQuantitySelector(),
                        Divider(
                            height: 6, color: AppColors.gray100, thickness: 6),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true, delegate: SliverDelegate(),),
              ];
            },
            body: TabBarView(
                children: [
                  ProductDetailInfo(),
                  Text("리뷰")
                ]
            ),
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context,
      double shrinkOffset,
      bool overlapsContent,) {
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
            style: TextStyle(fontFamily: 'PretendardMedium', fontSize: 12, color: AppColors.textSub),
          ),
          Text(
            "리뷰",
            style: TextStyle(fontFamily: 'PretendardMedium', fontSize: 12, color: AppColors.textSub),
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
