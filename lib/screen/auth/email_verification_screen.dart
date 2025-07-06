import 'package:damdiet/screen/auth/widgets/custom_textfield.dart';
import 'package:damdiet/screen/auth/widgets/status_message_text.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../widgets/bottom_cta_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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

              CustomTextField(hintText: '인증번호', isPassword: false),

              SizedBox(height: 32),

              BottomCTAButton(
                text: "인증번호 확인",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.home);
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
