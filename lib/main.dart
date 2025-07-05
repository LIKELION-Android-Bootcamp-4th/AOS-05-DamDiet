import 'package:damdiet/provider/price_range_provider.dart';
import 'package:damdiet/provider/product_provider.dart';
import 'package:damdiet/provider/search_provider.dart';
import 'package:damdiet/provider/signin_provider.dart';
import 'package:damdiet/routes/app_routes.dart';
import 'package:damdiet/screen/community/community_detail_screen.dart';
import 'package:damdiet/screen/community/community_write_screen.dart';
import 'package:damdiet/screen/community/kcal_calculator_screen.dart';
import 'package:damdiet/screen/home/home_screen.dart';

import 'package:damdiet/screen/login/email_verification_screen.dart';
import 'package:damdiet/screen/login/login_signin_screen.dart';
import 'package:damdiet/screen/login/login_signup_screen.dart';

import 'package:damdiet/screen/mypage/mypage_favorite_products_screen/mypage_favorite_products_screen.dart';
import 'package:damdiet/screen/mypage/mypage_my_community_screen.dart';
import 'package:damdiet/screen/mypage/mypage_my_orders_screen.dart';
import 'package:damdiet/screen/mypage/mypage_my_order_details/mypage_my_order_details_screen.dart';
import 'package:damdiet/screen/mypage/mypage_my_reviews/mypage_my_reviews_screen.dart';
import 'package:damdiet/screen/mypage/mypage_password_edit_screen.dart';
import 'package:damdiet/screen/mypage/mypage_profile_edit_screen.dart';
import 'package:damdiet/screen/payment_screen.dart';
import 'package:damdiet/screen/review/review_edit_screen.dart';
import 'package:damdiet/screen/review/review_write_screen.dart';
import 'package:damdiet/screen/search/product_detail/product_detail_screen.dart';
import 'package:damdiet/screen/search/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => PriceRangeProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => SignInProvider())
        ],
        child: const DamDietApp()
    )
  );
}

class DamDietApp extends StatelessWidget {
  const DamDietApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DamDiet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.products: (context) => ProductsScreen(),
        AppRoutes.productDetail: (context) => ProductDetailScreen(),
        AppRoutes.kcalCalculator: (context) => KcalCalculatorScreen(),
        AppRoutes.comDetail: (context) => CommunityDetailScreen(),
        AppRoutes.comWrite: (context) => CommunityWriteScreen(),
        AppRoutes.profileEdit: (context) => MyPageProfileEditScreen(),
        AppRoutes.passwordEdit: (context) => MyPagePasswordEditScreen(),
        AppRoutes.favoriteProduct: (context) => MyPageFavoriteProductsScreen(),
        AppRoutes.myReview: (context) => MyPageMyReviewsScreen(),
        AppRoutes.myCommunity: (context) => MyPageMyCommunityScreen(),
        AppRoutes.myOrders: (context) => MyPageMyOrdersScreen(),
        AppRoutes.myOrderDetail: (context) => MyPageMyOrderDetailsScreen(),
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

