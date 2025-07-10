import 'package:damdiet/data/datasource/favorite_datasource.dart';
import 'package:damdiet/data/datasource/cart_datasource.dart';
import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/datasource/mypage_datasource.dart';
import 'package:damdiet/data/datasource/nutrition_datasource.dart';
import 'package:damdiet/data/datasource/search_service.dart';
import 'package:damdiet/data/models/product/product_query.dart';
import 'package:damdiet/data/repositories/favorite_repository.dart';
import 'package:damdiet/data/repositories/cart_repository.dart';
import 'package:damdiet/data/repositories/mypage_repository.dart';
import 'package:damdiet/data/repositories/nutrition_repository.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:damdiet/data/repositories/search_repository.dart';
import 'package:damdiet/presentation/provider/nutrition_provider.dart';
import 'package:damdiet/presentation/provider/price_range_provider.dart';
import 'package:damdiet/presentation/screens/auth/signup_viewmodel.dart';
import 'package:damdiet/presentation/screens/cart/cart_view_model.dart';
import 'package:damdiet/presentation/screens/community/community_detail_screen.dart';
import 'package:damdiet/presentation/screens/community/community_write_screen.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage/mypage_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_address_edit_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/mypage_my_reviews_viewmodel.dart';
import 'package:damdiet/presentation/screens/product_detail/product_detail_viewmodel.dart';
import 'package:damdiet/presentation/screens/products/products_viewmodel.dart';
import 'package:damdiet/presentation/screens/search/search_screen.dart';
import 'package:damdiet/presentation/screens/search/search_viewmodel.dart';
import 'package:damdiet/presentation/screens/splash/splash_screen.dart';
import 'package:damdiet/presentation/screens/splash/splash_viewmodel.dart';
import 'package:damdiet/presentation/screens/home/home_viewmodel.dart';
import 'package:damdiet/presentation/screens/auth/signin_viewmodel.dart';
import 'package:damdiet/data/repositories/product_repository.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_screen.dart';
import 'package:damdiet/presentation/screens/home/home_screen.dart';
import 'package:damdiet/presentation/screens/cart/cart_screen.dart';
import 'package:damdiet/presentation/screens/auth/email_verification_screen.dart';
import 'package:damdiet/presentation/screens/auth/auth_signin_screen.dart';
import 'package:damdiet/presentation/screens/auth/auth_signup_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_favorite_product/mypage_favorite_products_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_favorite_product/mypage_favorite_products_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_community_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/mypage_my_order_details_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/mypage_my_reviews_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_password_edit_screen.dart';
import 'package:damdiet/presentation/screens/payment/payment_screen.dart';
import 'package:damdiet/presentation/screens/review/review_edit_screen.dart';
import 'package:damdiet/presentation/screens/review/review_write_screen.dart';
import 'package:damdiet/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:damdiet/presentation/screens/products/products_screen.dart';
import 'package:damdiet/data/datasource/product_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'data/models/request/order_request_dto.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          Provider(create: (_) => ProductDatasource()),
          Provider(create: (_) => CartDatasource()),
          Provider(create: (_) => FavoriteDatasource()),
          Provider(create: (_) => NutritionDataSource()),

          ProxyProvider<ProductDatasource, ProductRepository>(
            update: (_, datasource, __) => ProductRepository(datasource),
          ),
          ProxyProvider<CartDatasource, CartRepository>(
            update: (_, datasource, __) => CartRepository(datasource),
          ),
          ProxyProvider<FavoriteDatasource, FavoriteRepository>(
            update: (_, datasource, __) => FavoriteRepository(datasource),
          ),
          ProxyProvider<NutritionDataSource, NutritionRepository>(
            update: (_, datasource, __) => NutritionRepository(datasource),
          ),

          // 앱 전역에서 사용하는 뷰모델 냅두기
          ChangeNotifierProvider(create: (_) => SplashViewModel(FlutterSecureStorage())),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
          ChangeNotifierProvider(create: (_) => MypageViewModel(MyPageRepository((MyPageDataSource()))),)
          ChangeNotifierProvider(create: (_) => MyPageMyReviewsViewModel(ReviewRepository(ReviewDatasource()))),
        ],
        child: const DamDietApp()
    )
  );
}

class DamDietApp extends StatelessWidget {
  const DamDietApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DamDiet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.search: (context) => SearchScreen(),
        AppRoutes.kcalCalculator: (context) => KcalCalculatorScreenWrapper(),
        AppRoutes.comDetail: (context) => CommunityDetailScreen(),
        AppRoutes.comWrite: (context) => CommunityWriteScreen(),
        AppRoutes.profileEdit: (context) => MyPageAddressEditScreen(),
        AppRoutes.passwordEdit: (context) => MyPagePasswordEditScreen(),
        AppRoutes.favoriteProduct: (context) => MyPageFavoriteProductsScreenWrapper(),
        AppRoutes.myReview: (context) => MyPageMyReviewsScreen(),
        AppRoutes.myCommunity: (context) => MyPageMyCommunityScreen(),
        AppRoutes.myOrders: (context) => MyPageMyOrdersScreen(),
        AppRoutes.myOrderDetail: (context) => MyPageMyOrderDetailsScreen(),
        AppRoutes.cart: (context) => CartScreenWrapper(),
        AppRoutes.reviewWrite: (context) => ReviewWriteScreen(),
        AppRoutes.reviewEdit: (context) => ReviewEditScreen(),
        AppRoutes.signIn: (context) => SignInScreen(),
        AppRoutes.signUp: (context) => SignUpScreenWrapper(),
        AppRoutes.emailVerification: (context) => EmailVerificationScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.productDetail:
              final productId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ProductDetailScreen(productId: productId),
              );

          case AppRoutes.payment:
              final orderItems = settings.arguments as List<OrderItem>;
              return MaterialPageRoute(
                builder: (_) => PaymentScreen(orderItems: orderItems),
              );

          case AppRoutes.products:
            final args = settings.arguments;
            final query = args is ProductQuery ? args : ProductQuery();
            return MaterialPageRoute(
                builder: (_) => ProductsScreenWrapper( productQuery: query,)
        );

          default:
            return null;
        }
      },
    );
  }
}
