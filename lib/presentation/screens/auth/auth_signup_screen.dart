import 'package:damdiet/presentation/screens/auth/widgets/custom_textfield.dart';
import 'package:damdiet/presentation/screens/auth/widgets/status_message_text.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is SignUp Screen.'),
              CustomTextField(hintText: '이메일', isPassword: false),

              SizedBox(height: 16),

              CustomTextField(hintText: '비밀번호', isPassword: true),

              SizedBox(height: 16),

              CustomTextField(hintText: '비밀번호 확인', isPassword: true),

              SizedBox(height: 16),

              CustomTextField(hintText: '닉네임', isPassword: false),

              SizedBox(height: 32),

              StatusMessage(
                message: '이미 존재하는 이메일입니다.',
                isError: true,
              ),

              SizedBox(height: 32),

              BottomCTAButton(
                text: "회원가입",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.emailVerification);
                },
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("뒤로 가기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
