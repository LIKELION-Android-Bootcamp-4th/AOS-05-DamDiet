import 'package:flutter/material.dart';
import '../../../../core/constants/category_constants.dart';
import 'category_list_item.dart';
import 'list_title.dart';

class CategoryList extends StatelessWidget {
  final void Function(String) onCategorySelected;

  const CategoryList({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitle(title: '카테고리별 상품 보기'),
        Container(
          margin: const EdgeInsets.only(left: 16, bottom: 8),
          height: 64.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: appCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryListItem(
                category: appCategories[index],
                onTap: () => onCategorySelected(appCategories[index].nameEn),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8); // 구분자 간격
            },
          ),
        ),
      ],
    );
  }
}
