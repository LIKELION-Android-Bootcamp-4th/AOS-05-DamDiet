import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../../core/widgets/damdiet_appbar.dart';
import '../auth/widgets/custom_textfield.dart';

class MyPageNicknameEditScreen extends StatefulWidget {
  const MyPageNicknameEditScreen({super.key});

  @override
  State<MyPageNicknameEditScreen> createState() => _MyPageNicknameEditScreen();
}

class _MyPageNicknameEditScreen extends State<MyPageNicknameEditScreen> {
  final _newNnController = TextEditingController();

  String? _errorMessage;

  @override
  void dispose() {
    _newNnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _newNnController,
              ),
              SizedBox(height: 16,),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                        color: AppColors.errorRed,
                        fontSize: 14,
                        fontFamily: 'PretendardMedium'
                    ),
                  ),
                ),
            ],
          ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: BottomCTAButton(text: '닉네임 변경', onPressed:
            (){},)
        ),
      ),
    );
  }
}
