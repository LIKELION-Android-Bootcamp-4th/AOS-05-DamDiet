import 'package:damdiet/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../util/appcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
          children:
          [
            _buildHeader(),
            _buildContents(context),
          ]
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '국밥천국님',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'PretendardBold',
                    ),
                  ),
                  Text(
                    '오늘도 안녕하세요.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'PretendardBold',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 30,
            child: Row(
              children: [
                Image.asset('assets/images/damdiet_logo_4.png',width: 150,height: 150,),
              ],
            )
        )
      ],
    );
  }

  Widget _buildContents(BuildContext context) {
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
              _buildIconMenu(context),
              const SizedBox(height: 24),

              _buildSectionTitle('쇼핑'),
              _buildListTile('주문목록', () { Navigator.pushNamed(context, AppRoutes.myOrders); }),
              const Divider(indent: 16, endIndent: 16,color: AppColors.gray100,),
              const SizedBox(height: 16),

              _buildSectionTitle('커뮤니티'),
              _buildListTile('내 커뮤니티 관리', () { /* 페이지 */ }),
              _buildListTile('칼로리 계산기', () { /* 페이지 */ }),
              const Divider(indent: 16, endIndent: 16, color: AppColors.gray100,),
              const SizedBox(height: 16),

              _buildSectionTitle('내 정보 관리'),
              _buildListTile('내 정보 수정', () { /* ... */ }),
              const Divider(indent: 16, endIndent: 16, color: AppColors.gray100,),

              _buildListTile('로그아웃', () { /* 다이얼로그 */ }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconMenuItem(SvgPicture.asset(
          'assets/icons/ic_cart_outline.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
        ), '장바구니', () { /*페이지*/ }),

        _buildIconMenuItem(SvgPicture.asset(
          'assets/icons/ic_heart_outline.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
        ), '찜한상품', () { /*페이지*/ }),

        _buildIconMenuItem(SvgPicture.asset(
          'assets/icons/ic_edit.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
        ), '리뷰목록', () { /*페이지로*/ }),

      ],
    );
  }

  Widget _buildIconMenuItem(Widget iconWidget, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textMain, fontFamily: 'PretendardMedium')),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium'),
      ),
    );
  }

  Widget _buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: Text(title, style: const TextStyle(fontSize: 16, color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0,),
    );
  }
}
