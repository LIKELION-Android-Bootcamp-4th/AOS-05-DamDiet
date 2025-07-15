import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/appcolor.dart';

typedef OnItemTapped = void Function(int);

class DamDietBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final OnItemTapped onItemTapped;

  const DamDietBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ic_search_outline.svg', width: 20, height: 20),
          activeIcon: SvgPicture.asset('assets/icons/ic_search_fill.svg', width: 20, height: 20),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ic_calculator_outline.svg', width: 20, height: 20),
          activeIcon: SvgPicture.asset('assets/icons/ic_calculator_fill.svg', width: 20, height: 20),
          label: '칼로리계산기',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ic_home_outline.svg', width: 20, height: 20),
          activeIcon: SvgPicture.asset('assets/icons/ic_home_fill.svg', width: 20, height: 20),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ic_cart_outline.svg', width: 20, height: 20),
          activeIcon: SvgPicture.asset('assets/icons/ic_cart_fill.svg', width: 20, height: 20),
          label: '장바구니',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ic_mypage_outline.svg', width: 20, height: 20),
          activeIcon: SvgPicture.asset('assets/icons/ic_mypage_fill.svg', width: 20, height: 20),
          label: '마이페이지',
        ),
      ],
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.textSub,
      selectedItemColor: AppColors.primaryColor,
      onTap: onItemTapped,
    );
  }
}
