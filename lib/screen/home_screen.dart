import 'package:animations/animations.dart';
import 'package:damdiet/screen/cart_screen.dart';
import 'package:damdiet/screen/community_home_screen.dart';
import 'package:damdiet/screen/mypage_screen.dart';
import 'package:damdiet/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
import '../routes/app_routes.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.microtask((){
      context.read<ProductProvider>().getProducts();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '마이페이지'
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DamDietHomeScreen extends StatelessWidget {
  const DamDietHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Center(
      child: provider.isLoading? CircularProgressIndicator() : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Home Screen.'),
          Text(
            provider.products.isNotEmpty
                ? provider.products[0].name
                : '데이터 없음',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'PretendardBold',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.productDetail);
            },
            child: Text(
              "제품 상세",
              style: TextStyle(
                fontFamily: 'PretendardBold',
                fontSize: 20
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.products);
            },
            child: Text(
              "제품 상세",
              style: TextStyle(
                  fontFamily: 'PretendardThin',
                  fontSize: 20
              ),
            ),
          ),
          Image.asset('assets/images/damdiet_logo_1.png')
        ],
      ),
    );
  }
}
