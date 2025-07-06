import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../../../../core/theme/appcolor.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "담다잇이 처음이신가요?",
            style: TextStyle(
              fontFamily: 'PretendardLight',
              fontSize: 14,
              color: AppColors.textSub,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.signUp);
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text(
              "회원가입",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.textMain,
                decorationColor: AppColors.textMain,
                decorationThickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
