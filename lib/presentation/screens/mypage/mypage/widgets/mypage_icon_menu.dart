import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/appcolor.dart';
import '../../../../routes/app_routes.dart';
import 'mypage_icon_menu_item.dart';

class MyPageIconMenu extends StatelessWidget {
  const MyPageIconMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyPageIconMenuItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_cart_outline.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
          ),
          label: '장바구니',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.cart);
          },
        ),
        MyPageIconMenuItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_heart_outline.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
          ),
          label: '찜한상품',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.favoriteProduct);
          },
        ),
        MyPageIconMenuItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_edit.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
          ),
          label: '리뷰목록',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.myReview);
          },
        ),
      ],
    );
  }
}
