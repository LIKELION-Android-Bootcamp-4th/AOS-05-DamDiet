import 'package:damdiet/presentation/screens/mypage/mypage/mypage_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage/widgets/mypage_contents.dart';
import 'package:damdiet/presentation/screens/mypage/mypage/widgets/mypage_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/appcolor.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MypageViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            const MyPageHeader(),
            Consumer<MypageViewModel>(
              builder: (context, viewModel, child) {
                return MyPageContents(viewModel: viewModel);
              },
            ),
          ],
        ),
      ),
    );
  }
}
