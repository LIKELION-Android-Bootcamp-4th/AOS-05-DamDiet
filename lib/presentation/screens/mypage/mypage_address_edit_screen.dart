import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/mypage/mypage/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../../core/widgets/damdiet_appbar.dart';
import '../auth/widgets/custom_textfield.dart';

class MyPageAddressEditScreen extends StatefulWidget {
  const MyPageAddressEditScreen({super.key});

  @override
  State<MyPageAddressEditScreen> createState() => _MyPageAddressEditScreenState();
}

class _MyPageAddressEditScreenState extends State<MyPageAddressEditScreen> {
  var zipCodeController = TextEditingController();
  var addressController = TextEditingController();
  var addressDetailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var viewModel = context.read<MypageViewModel>();
      viewModel.getDeliAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MypageViewModel>();
    zipCodeController.text = viewModel.zipCode;
    addressController.text = viewModel.address;
    addressDetailController.text = viewModel.addressDetail;

    return Scaffold(
      appBar: DamdietAppbar(
        title: '기본 배송지 변경',
        showBackButton: true,
      ),
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
                      controller: zipCodeController,
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
              CustomTextField(
                hintText: '주소',
                isPassword: false,
                controller: addressController
              ),
              SizedBox(height: 16,),
              CustomTextField(
                hintText: '상세 주소',
                isPassword: false,
                controller: addressDetailController,
              ),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          child: BottomCTAButton(
            text: '확인',
            onPressed: () async {
              if(zipCodeController.text == '') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('우편 번호를 입력하세요.')));
                return;
              }
              if(addressDetailController.text == '') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('주소를 입력하세요.')));
                return;
              }


              if(await viewModel.changeDeliAddress(
                 zipCode: zipCodeController.text,
                 address: addressController.text,
                 addressDetail: addressDetailController.text
              )) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('기본 배송지가 변경되었습니다.')));
              }
              else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('배송지 변경에 실패하였습니다.')));
              }
            },
          ),
        ),
      ),
    );
  }
}

