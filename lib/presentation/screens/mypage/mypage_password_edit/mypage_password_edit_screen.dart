import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/bottom_cta_button.dart';
import '../../../../core/widgets/damdiet_appbar.dart';
import '../../../../data/repositories/mypage_repository.dart';
import '../../auth/widgets/custom_textfield.dart';
import 'mypage_password_edit_viewmodel.dart';



class MyPagePasswordEditScreenWrapper extends StatelessWidget {
  const MyPagePasswordEditScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<MyPageRepository>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => PasswordEditViewModel(repository),
      builder: (context, child) {
        return const MyPagePasswordEditScreen();
      },
    );
  }
}
class MyPagePasswordEditScreen extends StatelessWidget {
  const MyPagePasswordEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PasswordEditViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DamdietAppbar(
        title: '비밀번호 변경',
        showBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: '현재 비밀번호',
              isPassword: true,
              controller: viewModel.currentPasswordController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: '새로운 비밀번호',
              isPassword: true,
              controller: viewModel.newPasswordController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: '새로운 비밀번호 확인',
              isPassword: true,
              controller: viewModel.confirmPasswordController,
            ),
            const SizedBox(height: 16),
            if (viewModel.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(
                    color: AppColors.errorRed,
                    fontSize: 14,
                    fontFamily: 'PretendardMedium',
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          child: BottomCTAButton(
            text: viewModel.isLoading ? '변경 중...' : '비밀번호 변경',
            onPressed: viewModel.isLoading
                ? null
                :() async {
              final success = await viewModel.submitPassword();
              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('비밀번호가 변경되었습니다.')),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
