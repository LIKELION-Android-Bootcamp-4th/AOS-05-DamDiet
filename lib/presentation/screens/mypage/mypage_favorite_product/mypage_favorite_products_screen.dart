import 'package:damdiet/presentation/screens/mypage/mypage_favorite_product/mypage_favorite_products_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_favorite_product/widgets/favorite_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/damdiet_appbar.dart';
import '../../../../data/repositories/favorite_repository.dart';
import '../../../routes/app_routes.dart';

class MyPageFavoriteProductsScreenWrapper extends StatelessWidget {
  const MyPageFavoriteProductsScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<FavoriteRepository>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => MyPageFavoriteProductsViewModel(repository),
      child: const MyPageFavoriteProductsScreen(),
    );
  }
}

class MyPageFavoriteProductsScreen extends StatefulWidget {
  const MyPageFavoriteProductsScreen({super.key});

  @override
  State<MyPageFavoriteProductsScreen> createState() => _MyPageFavoriteProductsScreenState();
}

class _MyPageFavoriteProductsScreenState extends State<MyPageFavoriteProductsScreen> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.microtask(() {
      if (mounted) {
        context.read<MyPageFavoriteProductsViewModel>().fetchFavorites();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) { //목록 새로고침
      context.read<MyPageFavoriteProductsViewModel>().fetchFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageFavoriteProductsViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '찜한 상품',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
          itemCount: viewModel.favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.63,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final favoriteProduct = viewModel.favorites[index];
            return FavoriteListItem(
              favoriteProduct: favoriteProduct,
              // 찜 취소
              onRemove: () => viewModel.unfavoriteProduct(favoriteProduct.entity.id),
              // 상품 상세 이동
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.productDetail,
                arguments: favoriteProduct.entity.id,
              ),
            );
          },
        ),
      ),
    );
  }
}