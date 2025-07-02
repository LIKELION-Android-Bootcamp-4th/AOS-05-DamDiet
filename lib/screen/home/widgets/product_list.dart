import 'package:damdiet/models/Product.dart';
import 'package:damdiet/screen/home/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'category_list_item.dart';
import 'list_title.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.title});

  final String title;

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductListItem(product:Product(id: '0', name: '담다잇 닭가슴살 테스트용 긴 이르으으음', price: 7000),),
                ProductListItem(product:Product(id: '0', name: '담다잇 닭가슴살', price: 3000),),
                ProductListItem(product:Product(id: '0', name: '담다잇 닭가슴살', price: 2000),),
                ProductListItem(product:Product(id: '0', name: '담다잇 닭가슴살', price: 1000),),
                ProductListItem(product:Product(id: '0', name: '담다잇 닭가슴살', price: 5000),),
              ],
            )
        ),
      ],
    );
  }
}
