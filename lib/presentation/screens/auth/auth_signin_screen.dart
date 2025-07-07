import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/screens/auth/widgets/custom_textfield.dart';
import 'package:damdiet/presentation/screens/auth/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import 'signin_viewmodel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignInViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: '이메일',
                isPassword: false,
                controller: _emailController,
                onChanged: viewModel.setEmail
              ),

              const SizedBox(height: 16,),

              CustomTextField(
                hintText: '비밀번호',
                isPassword: true,
                controller: _passwordController,
                onChanged: viewModel.setPassword
              ),

              const SizedBox(height: 32,),

              if (viewModel.errorMessage.isNotEmpty)
                Text(
                  viewModel.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),

              BottomCTAButton(
                text: '로그인',
                onPressed: () async {
                  final isSuccess = await viewModel.signIn();

                  if (isSuccess && mounted) {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  }
                },
              ),

              const SignUpPrompt(),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("뒤로 가기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
