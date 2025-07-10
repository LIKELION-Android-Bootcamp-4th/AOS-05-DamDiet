import 'package:animations/animations.dart';
import 'package:damdiet/presentation/screens/cart/cart_screen.dart';
import 'package:damdiet/presentation/screens/community/community_home_screen.dart';
import 'package:damdiet/presentation/screens/home/widgets/category_list.dart';

import 'package:damdiet/presentation/screens/home/widgets/category_list_item.dart';

import 'package:damdiet/presentation/screens/home/widgets/home_banner.dart';
import 'package:damdiet/presentation/screens/home/widgets/notice_banner.dart';
import 'package:damdiet/presentation/screens/home/widgets/product_list.dart';
import 'package:damdiet/presentation/screens/search/search_screen.dart';
import 'package:damdiet/core/theme/appcolor.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/widgets/damdiet_appbar.dart';
import '../../../data/repositories/product_repository.dart';
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
  final List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    CommunityHomeScreen(),
    DamDietHomeScreen(),
    CartScreenWrapper(),
    MyPageScreen(),
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<HomeViewmodel>().getHomeProducts();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeBanner(),

              NoticeBanner(),

              Divider(height: 6, color: AppColors.gray100, thickness: 6),

              CategoryList(onCategorySelected: (category){
                print(category);
                //TODO Products 화면에 category 넘기는 작업
                Navigator.pushNamed(context, AppRoutes.products);
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

              Divider(height: 6, color: AppColors.gray100, thickness: 6),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.productDetail);
                },
                child: Text(
                  "제품 상세",
                  style: TextStyle(fontFamily: 'PretendardBold', fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.products);
                },
                child: Text(
                  "제품 목록?",
                  style: TextStyle(fontFamily: 'PretendardBold', fontSize: 20),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signIn);
                },
                child: Text(
                  "로그인",
                  style: TextStyle(fontFamily: 'PretendardBold', fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
