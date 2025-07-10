import 'package:damdiet/core/constants/category_constants.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/data/models/product/product_query.dart';
import 'package:damdiet/presentation/provider/search_provider.dart';
import 'package:damdiet/presentation/screens/products/products_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/category_outline_button.dart';
import '../../../core/widgets/product_list_item.dart';
import '../../../core/widgets/search_product_textfield.dart';
import '../../../models/ListProduct.dart';
import '../../routes/app_routes.dart';
import '../search/search_viewmodel.dart';

class ProductsScreen extends StatefulWidget {
  final ProductQuery productQuery;

  const ProductsScreen({super.key, required this.productQuery});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final vm = context.read<ProductsViewModel>();
      await vm.setInitialQuery(widget.productQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductsViewModel>();
    final hasFilters =
        viewModel.query.category != null ||
        (viewModel.query.minPrice != null &&
            viewModel.query.maxPrice != null) ||
        viewModel.query.search != null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              SearchProductTextField(
                controller: controller,
                onChanged: (value) {
                  viewModel.setSearch(value);
                },
                onSearch: () {
                  viewModel.getProducts();
                },
              ),
              SizedBox(height: 12),
              hasFilters
                  ? SizedBox(
                      height: 48,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (viewModel.query.category != null)
                            CategoryWithDeleteOutlineButton(
                              label: viewModel.query.category!.toKoCategory(),
                              onDelete: () => viewModel.removeCategory(),
                            ),
                          if (viewModel.query.minPrice != null &&
                              viewModel.query.maxPrice != null) ...[
                            const SizedBox(width: 8),
                            CategoryWithDeleteOutlineButton(
                              label:
                                  '${viewModel.query.minPrice} ~ ${viewModel.query.maxPrice} 원',
                              onDelete: () => viewModel.removePriceRange(),
                            ),
                          ],
                          if (viewModel.query.search != null) ...[
                            const SizedBox(width: 8),
                            CategoryWithDeleteOutlineButton(
                              label: viewModel.query.search!,
                              onDelete: () => viewModel.removeSearch(),
                            ),
                          ],
                        ],
                      ),
                    )
                  : SizedBox.shrink(),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ProductListItem(
                      product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetail,
                        arguments: product.id,
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppColors.gray100),
                itemCount: viewModel.products.length,
                padding: EdgeInsets.only(right: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
