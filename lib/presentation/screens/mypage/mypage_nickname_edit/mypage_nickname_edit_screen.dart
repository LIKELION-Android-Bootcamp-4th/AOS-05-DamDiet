import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/bottom_cta_button.dart';
import '../../../../core/widgets/damdiet_appbar.dart';
import '../../../../data/repositories/mypage_repository.dart';
import '../../auth/widgets/custom_textfield.dart';
import '../../../provider/user_provider.dart';
import 'mypage_nickname_edit_viewmodel.dart';

class MyPageNicknameEditScreenWrapper extends StatelessWidget {
  const MyPageNicknameEditScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<MyPageRepository>(context, listen: false);
    final userProvider = context.read<UserProvider>();


    return ChangeNotifierProvider<NicknameEditViewModel>(
      create: (_) => NicknameEditViewModel(repository,userProvider),
      builder: (context, child) {
        return MyPageNicknameEditScreen();
      },
    );
  }
}


class MyPageNicknameEditScreen extends StatelessWidget {
  MyPageNicknameEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NicknameEditViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '닉네임 변경',
        showBackButton: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: '새로운 닉네임',
                isPassword: false,
                controller: viewModel.nicknameController,
                onChanged: (_) {
                  if (viewModel.errorMessage != null) {
                    viewModel.clearErrorMessage();
                  }
                },
              ),
              SizedBox(height: 16,),
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
              text: viewModel.isLoading ? '변경 중...' : '닉네임 변경',
              onPressed: viewModel.isLoading
                  ? null
                  : () async {
                final success = await viewModel.submitNickname();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('닉네임이 변경되었습니다.')),
                  );
                }
              },
            ),
        ),
      ),
    );
  }
}
