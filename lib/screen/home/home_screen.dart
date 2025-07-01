import 'package:animations/animations.dart';
import 'package:damdiet/screen/cart_screen.dart';
import 'package:damdiet/screen/community_home_screen.dart';
import 'package:damdiet/screen/mypage_screen.dart';
import 'package:damdiet/screen/search_screen.dart';
import 'package:damdiet/util/appcolor.dart';
import 'package:flutter/material.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchIconPressed(){
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
          IconButton(onPressed: _onSearchIconPressed , icon: Icon(Icons.search)),
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
      )
    );
  }
}

class DamDietHomeScreen extends StatelessWidget {
  const DamDietHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Home Screen.'),
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
          ],
        ),
      ),
    );
  }
}
