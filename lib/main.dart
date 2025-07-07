import 'package:damdiet/presentation/provider/nutrition_provider.dart';
import 'package:damdiet/presentation/provider/price_range_provider.dart';
import 'package:damdiet/presentation/provider/search_provider.dart';
import 'package:damdiet/presentation/screens/cart/cart_view_model.dart';
import 'package:damdiet/presentation/screens/community/community_detail_screen.dart';
import 'package:damdiet/presentation/screens/community/community_write_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_address_edit_screen.dart';
import 'package:damdiet/presentation/screens/search/search_screen.dart';
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
import 'package:damdiet/presentation/screens/mypage/mypage_my_community_screen.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders_screen.dart';
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


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashViewModel(FlutterSecureStorage())),
          ChangeNotifierProvider(create: (_) => HomeViewmodel(ProductRepository(ProductDatasource()))),
          ChangeNotifierProvider(create: (_) => PriceRangeProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
          ChangeNotifierProvider(create: (_) => NutritionProvider()),
          ChangeNotifierProvider(create: (_) => CartViewModel()),
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
        AppRoutes.products: (context) => ProductsScreen(),
        AppRoutes.productDetail: (context) => ProductDetailScreen(),
        AppRoutes.kcalCalculator: (context) => KcalCalculatorScreen(),
        AppRoutes.comDetail: (context) => CommunityDetailScreen(),
        AppRoutes.comWrite: (context) => CommunityWriteScreen(),
        AppRoutes.profileEdit: (context) => MyPageAddressEditScreen(),
        AppRoutes.passwordEdit: (context) => MyPagePasswordEditScreen(),
        AppRoutes.favoriteProduct: (context) => MyPageFavoriteProductsScreen(),
        AppRoutes.myReview: (context) => MyPageMyReviewsScreen(),
        AppRoutes.myCommunity: (context) => MyPageMyCommunityScreen(),
        AppRoutes.myOrders: (context) => MyPageMyOrdersScreen(),
        AppRoutes.myOrderDetail: (context) => MyPageMyOrderDetailsScreen(),
        AppRoutes.cart: (context) => CartScreen(),
        AppRoutes.payment: (context) => PaymentScreen(),
        AppRoutes.reviewWrite: (context) => ReviewWriteScreen(),
        AppRoutes.reviewEdit: (context) => ReviewEditScreen(),
        AppRoutes.signIn: (context) => SignInScreen(),
        AppRoutes.signUp: (context) => SignUpScreen(),
        AppRoutes.emailVerification: (context) => EmailVerificationScreen(),
      },
    );
  }
}
