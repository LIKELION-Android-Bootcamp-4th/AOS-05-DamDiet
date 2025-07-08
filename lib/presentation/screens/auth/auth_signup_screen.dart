import 'package:damdiet/presentation/screens/auth/signup_viewmodel.dart';
import 'package:damdiet/presentation/screens/auth/widgets/custom_textfield.dart';
import 'package:damdiet/presentation/screens/auth/widgets/status_message_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nicknameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(hintText: '이메일', isPassword: false, controller: _emailController, onChanged: viewModel.setEmail,),

              SizedBox(height: 16),

              CustomTextField(hintText: '비밀번호', isPassword: true, controller: _passwordController, onChanged: viewModel.setPassword,),

              SizedBox(height: 16),

              CustomTextField(hintText: '비밀번호 확인', isPassword: true, controller: _confirmPasswordController, onChanged: viewModel.setConfirmPassword,),

              SizedBox(height: 16),

              CustomTextField(hintText: '닉네임', isPassword: false, controller: _nicknameController, onChanged: viewModel.setNickname),

              SizedBox(height: 28),

              // 에러 메시지 출력
              if (viewModel.errorMessage.isNotEmpty)
                StatusMessage(
                  message: viewModel.errorMessage,
                  isError: true,
                ),

              SizedBox(height: 4),

              BottomCTAButton(
                text: "회원가입",
                onPressed: () async {
                  final isSuccess = await viewModel.signUp();
                  if (isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('회원가입 성공! 로그인 화면으로 이동합니다.')),
                    );
                    await Future.delayed(const Duration(milliseconds: 500));

                    Navigator.pushNamed(context, AppRoutes.signIn);
                  }
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
