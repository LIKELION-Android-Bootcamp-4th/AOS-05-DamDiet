import 'package:damdiet/models/Product.dart';
import 'package:damdiet/screen/home/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'category_list_item.dart';
import 'list_title.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.title, required this.productList});

  final String title;
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitle( title: title,),
        Container(
            margin: const EdgeInsets.only(
                left: 16,
                bottom: 8
            ),
            height: 152.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context,index) {
                final product = productList[index];
                return ProductListItem(product: product);
              },
            )
        ),
      ],
    );
  }
}
