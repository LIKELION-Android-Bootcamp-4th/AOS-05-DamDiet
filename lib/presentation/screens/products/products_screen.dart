import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/category_outline_button.dart';
import '../../../core/widgets/product_list_item.dart';
import '../../../core/widgets/search_product_textfield.dart';
import '../../../models/ListProduct.dart';
import '../../routes/app_routes.dart';
import '../search/search_viewmodel.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SearchViewModel>(context);

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
                  viewModel.setProductName(value);
                },
                onSearch: () {
                  viewModel.searchProducts();
                },
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  CategoryWithDeleteOutlineButton(text: "닭가슴살"),
                  SizedBox(width: 12),
                  CategoryWithDeleteOutlineButton(text: '5000 ~ 10000원'),
                ],
              ),
              SizedBox(height: 12),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductListItem(
                    name: viewModel.searchProductList[index].name,
                    price: viewModel.searchProductList[index].price,
                    discount: viewModel.searchProductList[index].discount,
                    rating: viewModel.searchProductList[index].rating,
                    image: viewModel.searchProductList[index].image,

                    /*name: listViewData[index].name,
                    price: listViewData[index].price,
                    discount: listViewData[index].discount,
                    rating: listViewData[index].rating!,
                    image: listViewData[index].image,*/
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppColors.gray100),
                itemCount: viewModel.searchProductList.length,
                padding: EdgeInsets.only(right: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
