import 'package:damdiet/util/appcolor.dart';
import 'package:damdiet/widgets/bottom_cta_button.dart';
import 'package:flutter/material.dart';

import '../login/widgets/custom_textfield.dart';

class MyPageProfileEditScreen extends StatelessWidget {
  const MyPageProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      hintText: '우편번호',
                      isPassword: false,
                    ),
                  ),
                  const SizedBox(width: 8), // 간격
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // ← radius
                        ),
                      ),
                      child: const Text(
                        '주소 검색',
                        style: TextStyle(color: Colors.white, fontFamily: 'PretendardBold', fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              CustomTextField(hintText: '주소', isPassword: false),
              SizedBox(height: 16,),
              CustomTextField(hintText: '상세 주소', isPassword: false),
              SizedBox(height: 16,),
              BottomCTAButton(text: '배송지 저장', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
