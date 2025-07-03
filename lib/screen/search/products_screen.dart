import 'package:damdiet/util/appcolor.dart';
import 'package:damdiet/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

import '../../models/ListProduct.dart';
import '../../routes/app_routes.dart';
import '../../widgets/category_outline_button.dart';
import '../../widgets/search_product_textfield.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
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
              SizedBox(
                height: 500,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductListItem(
                      name: listViewData[index].name,
                      price: listViewData[index].price,
                      discount: listViewData[index].discount,
                      rating: listViewData[index].rating!,
                      image: listViewData[index].image,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(color: AppColors.gray100),
                  itemCount: listViewData.length,
                  padding: EdgeInsets.only(right: 12.0),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.productDetail);
                },
                child: Text("제품 상세"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("뒤로 가기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
