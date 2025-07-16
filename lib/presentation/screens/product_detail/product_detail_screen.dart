import 'package:damdiet/core/exceptions/quantity_invalid_exception.dart';
import 'package:damdiet/data/models/payment/payment_item.dart';
import 'package:damdiet/presentation/screens/product_detail/product_detail_viewmodel.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_detail_info.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_detail_main_info.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_image.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_quantity_selector.dart';
import 'package:damdiet/presentation/screens/product_detail/widgets/product_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolor.dart';
import '../../../data/models/request/order_request_dto.dart';
import '../../../data/repositories/product_repository.dart';
import '../../routes/app_routes.dart';



class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailViewmodel(
        context.read<ProductRepository>(),
      )..getProductDetail(id: productId),
      child: _ProductDetailContent(),
    );
  }
}


class _ProductDetailContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<ProductDetailViewmodel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final hasDiscount = viewModel.product.discount > 0;

    final int price = hasDiscount
        ? (viewModel.product.price * (1 - viewModel.product.discount / 100))
              .round()
        : viewModel.product.price;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor: Colors.white,
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
                              ProductImage(imageUrl: viewModel.product.image),
                              ProductDetailMainInfo(product: viewModel.product),
                              Divider(
                                height: 6,
                                color: AppColors.gray100,
                                thickness: 6,
                              ),
                              ProductQuantitySelector(
                                quantity: viewModel.quantity,
                                totalPrice: price * viewModel.quantity,
                                onIncrement: () {
                                  viewModel.increaseQuantity();
                                },
                                onDecrement: () {
                                  viewModel.decreaseQuantity();
                                },
                                onCancel: () {
                                  viewModel.setQuantity(0);
                                },
                              ),
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
                      SingleChildScrollView(
                        child: ProductDetailInfo(
                          productNutrition: viewModel.product.attributes,
                        ),
                      ),
                      SingleChildScrollView(
                        child: ProductReviewsTab(
                          reviewList: viewModel.product.reviews ?? [],
                          rating: viewModel.product.rating,
                        ),
                      ),
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
                onPressed: () async {
                  final message = await viewModel.toggleFavorite();
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: SvgPicture.asset(
                  viewModel.product.isFavorite
                      ? 'assets/icons/ic_heart_fill.svg'
                      : 'assets/icons/ic_heart_outline.svg',
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
                onPressed: () async {
                  try {
                    await viewModel.addToCart();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('장바구니에 상품을 담았습니다!')));
                  } catch (e) {
                    if (e is QuantityInvalidException) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('장바구니 담기에 실패했습니다.')),
                      );
                    }
                  }
                },
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
                onPressed: () {
                  if (viewModel.quantity <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('수량을 선택해주세요.')),
                    );
                    return;
                  }

                  final orderItem = OrderItem(
                    product: viewModel.product.id,
                    quantity: viewModel.quantity,
                    unitPrice: viewModel.product.price
                  );
                  final paymentItem = PaymentItem(
                      name: viewModel.product.name,
                      price: viewModel.product.price,
                      discount: viewModel.product.discount,
                      image: viewModel.product.image
                  );

                  Navigator.pushNamed(
                    context,
                    AppRoutes.payment,
                    arguments: [[orderItem], [paymentItem], null]
                  );

                },
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
