import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/category_outline_button.dart';
import '../../../core/widgets/product_list_item.dart';
import '../../../core/widgets/search_product_textfield.dart';
import '../../../models/ListProduct.dart';
import '../../routes/app_routes.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var search = Provider.of<SearchProvider>(context);
    final listViewData = [
      Product(
        id: "1",
        name: "담다잇 닭가슴살 블랙페퍼맛",
        price: 5000,
        discount: 0,
        rating: 3.5,
        image: 'assets/images/damdiet_logo_1.png',
      ),
      Product(
        id: "2",
        name: "담다잇 닭가슴살 블랙페퍼맛",
        price: 10000,
        discount: 0,
        rating: 3.5,
        image: 'assets/images/damdiet_logo_1.png',
      ),
      Product(
        id: "3",
        name: "담다잇 닭가슴살 블랙페퍼맛",
        price: 10000,
        discount: 30,
        rating: 4.4,
        image: 'assets/images/damdiet_logo_2.png',
      ),
      Product(
        id: "4",
        name: "담다잇 닭가슴살 블랙페퍼맛",
        price: 10000,
        discount: 40,
        rating: 4.4,
        image: 'assets/images/damdiet_logo_2.png',
      ),
      Product(
        id: "5",
        name: "p5",
        price: 10000,
        discount: 30,
        rating: 4.4,
        image: 'assets/images/damdiet_logo_1.png',
      ),
      Product(
        id: "6",
        name: "p6",
        price: 10000,
        discount: 30,
        rating: 4.4,
        image: 'assets/images/damdiet_logo_1.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              SearchProductTextField(controller: controller),
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
                    name: search.searchProductList[index].name,
                    price: search.searchProductList[index].price,
                    discount: search.searchProductList[index].discount,
                    rating: search.searchProductList[index].rating,
                    image: search.searchProductList[index].image,


                    /*name: listViewData[index].name,
                    price: listViewData[index].price,
                    discount: listViewData[index].discount,
                    rating: listViewData[index].rating!,
                    image: listViewData[index].image,*/
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppColors.gray100),
                itemCount: search.searchProductList.length,
                padding: EdgeInsets.only(right: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
