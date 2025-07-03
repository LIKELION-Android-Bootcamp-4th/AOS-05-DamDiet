import 'package:flutter/material.dart';
import 'category_list_item.dart';
import 'list_title.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitle( title: '카테고리별 상품 보기',),
        Container(
            margin: const EdgeInsets.only(
                left: 16,
                bottom: 8
            ),
            height: 64.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CategoryListItem(categoryName: '하루식단세트', imageUrl: 'assets/images/damdiet_logo_5.png'),
                CategoryListItem(categoryName: '닭가슴살', imageUrl: 'assets/images/damdiet_logo_5.png'),
                CategoryListItem(categoryName: '볶음밥/도시락', imageUrl: 'assets/images/damdiet_logo_5.png'),
                CategoryListItem(categoryName: '샐러드', imageUrl: 'assets/images/damdiet_logo_5.png'),
                CategoryListItem(categoryName: '간식/음료', imageUrl: 'assets/images/damdiet_logo_5.png'),
              ],
            )
        ),
      ],
    );
  }
}