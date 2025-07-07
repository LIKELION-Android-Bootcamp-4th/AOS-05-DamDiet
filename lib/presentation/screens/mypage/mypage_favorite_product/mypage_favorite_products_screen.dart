import 'package:damdiet/presentation/screens/mypage/mypage_favorite_product/widgets/favorite_list_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/damdiet_appbar.dart';
import '../../../../models/FavoriteProduct.dart';
import '../../../../models/Product.dart';
import '../../../routes/app_routes.dart';

class MyPageFavoriteProductsScreen extends StatefulWidget {
  const MyPageFavoriteProductsScreen({super.key});

  @override
  State<MyPageFavoriteProductsScreen> createState() =>
      _MyPageFavoriteProductsScreenState();
}

class _MyPageFavoriteProductsScreenState
    extends State<MyPageFavoriteProductsScreen> {
  //TODO: Provider 로 상태관리 연결
  // 현재는 setState() 로 구현해놨음
  void _removeItem(String productId) {
    setState(() {
      dummyLikedProducts.removeWhere((product) => product.id == productId);
    });
  }

  final List<FavoriteProduct> dummyLikedProducts = [
    FavoriteProduct(
      id: '100',
      product: Product(
        id: '1',
        name: '스마트 워치',
        price: 299000,
        isFavorite: true,
      ),
      likedAt: DateTime.now(),
    ),
    FavoriteProduct(
      id: '101',
      product: Product(
        id: '2',
        name: '무선 이어폰',
        price: 159000,
        isFavorite: true,
      ),
      likedAt: DateTime.now(),
    ),
    FavoriteProduct(
      id: '102',
      product: Product(
        id: '3',
        name: '게이밍 마우스',
        price: 69000,
        isFavorite: true,
      ),
      likedAt: DateTime.now(),
    ),
    FavoriteProduct(
      id: '103',
      product: Product(
        id: '4',
        name: '기계식 키보드',
        price: 129000,
        isFavorite: true,
      ),
      likedAt: DateTime.now(),
    ),
    FavoriteProduct(
      id: '104',
      product: Product(
        id: '5',
        name: '휴대용 보조배터리 ',
        price: 39000,
        isFavorite: true,
      ),
      likedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '찜한 상품',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: GridView.builder(
          itemCount: dummyLikedProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.63,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final favoriteProduct = dummyLikedProducts[index];
            return FavoriteListItem(
              favoriteProduct: favoriteProduct,
              onRemove: () => _removeItem(favoriteProduct.id),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.productDetail),
            );
          },
        ),
      ),
    );
  }
}
