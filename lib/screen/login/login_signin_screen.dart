import 'package:damdiet/screen/login/widgets/custom_textfield.dart';
import 'package:damdiet/screen/login/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../widgets/bottom_cta_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: '이메일',
                isPassword: false,
              ),

              SizedBox(height: 16,),

              CustomTextField(
                hintText: '비밀번호',
                isPassword: true,
              ),

              SizedBox(height: 32,),

              BottomCTAButton(
                text: "로그인",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              ),

              SignUpPrompt(),

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
