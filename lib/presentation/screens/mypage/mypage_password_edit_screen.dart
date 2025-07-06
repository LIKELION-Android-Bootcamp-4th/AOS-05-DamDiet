import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../auth/widgets/custom_textfield.dart';

class MyPagePasswordEditScreen extends StatefulWidget {
  const MyPagePasswordEditScreen({super.key});

  @override
  State<MyPagePasswordEditScreen> createState() => _MyPagePasswordEditScreen();
}

class _MyPagePasswordEditScreen extends State<MyPagePasswordEditScreen> {
  final _currentPwController = TextEditingController();
  final _newPwController = TextEditingController();
  final _confirmPwController = TextEditingController();

  String? _errorMessage;

  // 비밀번호 검증 정규식: 최소 8자, 영어, 숫자, 특수문자 포함
  final RegExp _pwRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&~])[A-Za-z\d@$!%*#?&~]{8,}$');

  void _validateAndSubmit() {
    final newPw = _newPwController.text.trim();
    final confirmPw = _confirmPwController.text.trim();

    if (!_pwRegExp.hasMatch(newPw)) {
      setState(() {
        _errorMessage = '비밀번호는 8자 이상, 영문/숫자/특수문자를 포함해야 합니다.';
      });
      return;
    }

    if (newPw != confirmPw) {
      setState(() {
        _errorMessage = '새 비밀번호와 일치하지 않습니다.';
      });
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    // TODO: 서버에 비밀번호 변경 요청 보내기, 성공 시 로그아웃 처리
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('비밀번호가 변경되었습니다.')),
    );
  }

  @override
  void dispose() {
    _currentPwController.dispose();
    _newPwController.dispose();
    _confirmPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Column 높이 최소화
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: '현재 비밀번호',
                isPassword: true,
                controller: _currentPwController,
              ),
              SizedBox(height: 16,),
              CustomTextField(
                hintText: '새로운 비밀번호',
                isPassword: true,
                controller: _newPwController,
              ),
              SizedBox(height: 16,),
              CustomTextField(
                hintText: '새로운 비밀번호 확인',
                isPassword: true,
                controller: _confirmPwController,
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
              BottomCTAButton(text: '비밀번호 변경', onPressed:
                _validateAndSubmit,)
            ],
          ),
        ),
      ),
    );
  }
}
