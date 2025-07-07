import 'package:flutter/material.dart';
import '../../../../../core/theme/appcolor.dart';
import '../../../../routes/app_routes.dart';
import 'mypage_icon_menu.dart';
import 'mypage_list_title.dart';
import 'mypage_section_title.dart';

class MyPageContents extends StatelessWidget {
  const MyPageContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyPageIconMenu(),
              const SizedBox(height: 24),

              const MyPageSectionTitle('쇼핑'),
              MyPageListTile('주문목록', () {
                Navigator.pushNamed(context, AppRoutes.myOrders);
              }),
              const Divider(indent: 16, endIndent: 16, color: AppColors.gray100),
              const SizedBox(height: 16),

              const MyPageSectionTitle('커뮤니티'),
              MyPageListTile('내 커뮤니티 관리', () {
                Navigator.pushNamed(context, AppRoutes.myCommunity);
              }),
              MyPageListTile('칼로리 계산기', () {
                Navigator.pushNamed(context, AppRoutes.kcalCalculator);
              }),
              const Divider(indent: 16, endIndent: 16, color: AppColors.gray100),
              const SizedBox(height: 16),

              const MyPageSectionTitle('내 정보 관리'),
              MyPageListTile('배송지 변경', () {
                Navigator.pushNamed(context, AppRoutes.profileEdit);
              }),
              MyPageListTile('비밀번호 변경', () {
                Navigator.pushNamed(context, AppRoutes.passwordEdit);
              }),
              const Divider(indent: 16, endIndent: 16, color: AppColors.gray100),

              MyPageListTile('로그아웃', () {
                // TODO: 로그아웃 다이얼로그 처리
              }),
            ],
          ),
        ),
      ),
    );
  }
}
