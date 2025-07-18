import 'package:animations/animations.dart';
import 'package:damdiet/presentation/screens/cart/cart_screen.dart';
import 'package:damdiet/presentation/screens/home/widgets/category_list.dart';
import 'package:damdiet/presentation/screens/home/widgets/home_banner.dart';
import 'package:damdiet/presentation/screens/home/widgets/product_list.dart';
import 'package:damdiet/presentation/screens/search/search_screen.dart';
import 'package:damdiet/core/theme/appcolor.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/widgets/damdiet_appbar.dart';
import '../../../data/models/product/product_query.dart';
import '../../../data/repositories/product_repository.dart';
import '../kcal_calculator/kcal_calculator_screen.dart';
import '../mypage/mypage/mypage_screen.dart';
import 'home_viewmodel.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  DateTime? _lastBackPressed;

  final List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    KcalCalculatorScreenWrapper(),
    DamDietHomeScreen(),
    CartScreenWrapper(),
    MyPageScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (_selectedIndex == 2) {
          DateTime nowTime = DateTime.now();
          if (_lastBackPressed == null ||
              nowTime.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
            _lastBackPressed = nowTime;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('2초안에 한 번 더 누르면 종료됩니다.')),
            );          } else {
            SystemNavigator.pop();
          }
        }
        else{
          setState(() {
            _selectedIndex = 2;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 1000),
          transitionBuilder:
              (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: DamDietBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class DamDietHomeScreen extends StatelessWidget {
  const DamDietHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepository = Provider.of<ProductRepository>(
        context, listen: false);

    return ChangeNotifierProvider(
      create: (_) =>
      HomeViewmodel(productRepository)
        ..getHomeProducts(),
      child: _DamDietHomeScreenContent(),
    );
  }
}

class _DamDietHomeScreenContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewmodel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '',
        isHome: true,
        action: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, AppRoutes.search);
            },
          icon: Icon(Icons.search),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeBanner(),

            CategoryList(onCategorySelected: (category){
              final query = ProductQuery(category: category);
              Navigator.pushNamed(
                context,
                AppRoutes.products,
                arguments: query,
              );
            }),

            Divider(height: 6, color: AppColors.gray100, thickness: 6),

            ProductList(title: "따끈따끈! 신제품", productList: viewModel.latestProducts),

            Divider(height: 6, color: AppColors.gray100, thickness: 6),

            ProductList(
              title: "다른 고객님들이 많이 본 상품",
              productList: viewModel.popularProducts,
            ),

            Divider(height: 6, color: AppColors.gray100, thickness: 6),

            ProductList(
              title: "판매량 높은 상품",
              productList: viewModel.salesProducts,
            ),
          ],
        ),
      ),
    );
  }
}
