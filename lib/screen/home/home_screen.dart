import 'package:animations/animations.dart';
import 'package:damdiet/screen/cart_screen.dart';
import 'package:damdiet/screen/community_home_screen.dart';
import 'package:damdiet/screen/home/widgets/category_list.dart';
import 'package:damdiet/screen/home/widgets/category_list_item.dart';
import 'package:damdiet/screen/home/widgets/home_banner.dart';
import 'package:damdiet/screen/home/widgets/notice_banner.dart';
import 'package:damdiet/screen/home/widgets/product_list.dart';
import 'package:damdiet/screen/mypage_screen.dart';
import 'package:damdiet/screen/search_screen.dart';
import 'package:damdiet/util/appcolor.dart';
import 'package:damdiet/widgets/underline_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';
import '../../routes/app_routes.dart';
import '../../widgets/bottom_nav_bar.dart';

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
    CartScreen(),
    MyPageScreen(),
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask((){
      context.read<ProductProvider>().getProducts();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchIconPressed() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //TODO : title Image 정하고 변경
        title: Text(
          "DamDiet",
          style: TextStyle(
            fontFamily: 'PretendardExtraBlod',
            fontSize: 24,
            color: AppColors.textMain,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _onSearchIconPressed, icon: Icon(Icons.search)),
        ],
        elevation: 0,
      ),
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
    final provider = context.watch<ProductProvider>();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeBanner(),

            NoticeBanner(),

            Divider(height: 6, color: AppColors.gray100, thickness: 6,),

            CategoryList(),

            Divider(height: 6, color: AppColors.gray100, thickness: 6,),

            ProductList(title: "할인율 큰 상품", productList: provider.products),

            Divider(height: 6, color: AppColors.gray100, thickness: 6,),

            ProductList(title: "다른 고객님들이 많이 구매한 상품", productList: provider.products),

            Divider(height: 6, color: AppColors.gray100, thickness: 6,),

            ProductList(title: "이런 상품은 어때요?", productList: provider.products),

            Divider(height: 6, color: AppColors.gray100, thickness: 6,),

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
    );
  }
}
