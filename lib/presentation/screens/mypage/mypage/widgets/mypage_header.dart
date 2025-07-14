import 'package:damdiet/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final nickname = userProvider.user?.nickName ?? '회원';

    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$nickname님',
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
        ),
        Positioned(
          right: 30,
          child: Image.asset(
            'assets/images/damdiet_logo_4.png',
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}
