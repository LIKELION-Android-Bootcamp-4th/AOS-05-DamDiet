import 'package:damdiet/screen/payment/widgets/payment_textfield.dart';
import 'package:damdiet/util/appcolor.dart';
import 'package:damdiet/screen/payment/widgets/payment_checkbox_widget.dart';
import 'package:damdiet/screen/payment/widgets/payment_spacebetween_widget.dart';
import 'package:damdiet/screen/payment/widgets/select_payment._widget.dart';
import 'package:flutter/material.dart';

import '../models/ListProduct.dart';
import '../routes/app_routes.dart';
import '../widgets/bottom_cta_button.dart';
import '../widgets/product_list_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "배송지",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 64,
                    child: Text(
                      "받는사람",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PretendardRegular',
                        color: AppColors.textMain,
                      ),
                    ),
                  ),
                  PaymentTextField()
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 64,
                    child: Text(
                      "주소",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PretendardRegular',
                        color: AppColors.textMain,
                      ),
                    ),
                  ),
                  PaymentTextField(flex: 2, hintText: '우편주소'),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: BottomCTAButton(
                      text: "주소검색",
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 64),
                  PaymentTextField(hintText: '상세주소'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 64),
                  PaymentTextField()
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 64,
                    child: Text(
                      "휴대전화",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PretendardRegular',
                        color: AppColors.textMain,
                      ),
                    ),
                  ),
                  PaymentTextField(flex: 3),
                  SizedBox(width: 14),
                  PaymentTextField(flex: 4),
                  SizedBox(width: 14),
                  PaymentTextField(flex: 4),
                ],
              ),
              SizedBox(height: 26),
              Divider(thickness: 6, color: AppColors.gray100),
              SizedBox(height: 16),
              Text(
                "주문상품",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain,
                ),
              ),
              ProductListItem(

                  name: "담다잇 닭가슴살 블랙페퍼맛",
                  price: 10000,
                  discount: 30,
                  image: 'assets/images/damdiet_logo_1.png',

              ),
              Divider(thickness: 6, color: AppColors.gray100),
              PaymentSpaceBetweenWidget(leftText: '배송비', rightText: '3,500 원'),
              Divider(thickness: 1, color: AppColors.textSub),
              SizedBox(height: 20),
              Text(
                "결제정보",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PretendardBold',
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 12),
              PaymentSpaceBetweenWidget(leftText: '주문상품', rightText: '16,000원'),
              SizedBox(height: 12),
              PaymentSpaceBetweenWidget(leftText: '배송비', rightText: '+3,000원'),
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '총 결제금액',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardBold',
                      color: AppColors.textMain,
                    ),
                  ),
                  Text(
                    '19,000원',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardBold',
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Divider(thickness: 1, color: AppColors.textSub),
              SizedBox(height: 18),
              Text(
                "결제수단",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PretendardBold',
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "결제수단 선택",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardRegular',
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 14),
              SelectPaymentWidget(),
              SizedBox(height: 24),
              Divider(thickness: 1, color: AppColors.textSub),
              SizedBox(height: 24),
              PaymentCheckboxWidget(),
              SizedBox(height: 36),
              BottomCTAButton(
                text: "주문하기",
                onPressed: () {
                  Navigator.pop(context);
                  //Navigator.pushNamed(context, AppRoutes.home);
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
