import 'package:flutter/material.dart';

import '../../models/LikedProduct.dart';
import '../../models/Product.dart';

class MyPageFavoriteProductsScreen extends StatelessWidget {
  const MyPageFavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LikedProduct> dummyLikedProducts = [
      LikedProduct(
        id: '100',
        product: Product(
          id: '1',
          name: '스마트 워치',
          price: 299000,
          isFavorite: true,
        ),
        likedAt: DateTime.now(),
      ),
      LikedProduct(
        id: '101',
        product: Product(
          id: '2',
          name: '무선 이어폰',
          price: 159000,
          isFavorite: true,
        ),
        likedAt: DateTime.now(),
      ),
      LikedProduct(
        id: '102',
        product: Product(
          id: '3',
          name: '게이밍 마우스',
          price: 69000,
          isFavorite: true,
        ),
        likedAt: DateTime.now(),
      ),
      LikedProduct(
        id: '103',
        product: Product(
          id: '4',
          name: '기계식 키보드',
          price: 129000,
          isFavorite: true,
        ),
        likedAt: DateTime.now(),
      ),
      LikedProduct(
        id: '104',
        product: Product(
          id: '5',
          name: '휴대용 보조배터리',
          price: 39000,
          isFavorite: true,
        ),
        likedAt: DateTime.now(),
      ),
    ];




    return Scaffold(
      body: GridView.builder(
        itemCount: dummyLikedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final product = dummyLikedProducts[index];
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: Text(product.product.name!),
            ),
          );
        },
      )
    );
  }
}
