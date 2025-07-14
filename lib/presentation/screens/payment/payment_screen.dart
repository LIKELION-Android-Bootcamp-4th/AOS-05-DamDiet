import 'package:damdiet/data/models/product/product.dart';
import 'package:damdiet/data/repositories/payment_repository.dart';
import 'package:damdiet/presentation/screens/payment/payment_viewmodel.dart';
import 'package:damdiet/presentation/screens/payment/widgets/payment_list_item.dart';
import 'package:damdiet/presentation/screens/payment/widgets/payment_textfield.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/payment/widgets/payment_checkbox_widget.dart';
import 'package:damdiet/presentation/screens/payment/widgets/payment_spacebetween_widget.dart';
import 'package:damdiet/presentation/screens/payment/widgets/select_payment._widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../../core/widgets/product_list_item.dart';
import '../../../data/models/payment/payment_item.dart';
import '../../../data/models/request/order_request_dto.dart';
import '../../routes/app_routes.dart';

class PaymentScreenWrapper extends StatelessWidget {
  const PaymentScreenWrapper({super.key,
    required this.orderItems,
    required this.paymentItems,
    required this.cartIds
  });

  final List<OrderItem> orderItems;
  final List<PaymentItem> paymentItems;
  final List? cartIds;

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<PaymentRepository>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => PaymentViewmodel(repo),
      builder: (context, child) {
        return PaymentScreen(orderItems: orderItems, paymentItems: paymentItems, cartIds: cartIds);
      },
    );
  }
}


class PaymentScreen extends StatefulWidget {
  final List<OrderItem> orderItems;
  final List<PaymentItem> paymentItems;
  final List? cartIds;

  const PaymentScreen({super.key, required this.orderItems, required this.paymentItems, required this.cartIds});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var nameCtrl = TextEditingController();
  var postCtrl = TextEditingController();
  var addressCtrl = TextEditingController();
  var addressDetailCtrl = TextEditingController();
  var phoneFirstCtrl = TextEditingController();
  var phoneSecondCtrl = TextEditingController();
  var phoneThirdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int productTotalPrice = 0;
    for(int n = 0; n < widget.orderItems.length; n++) {
      productTotalPrice += (widget.orderItems[n].unitPrice * widget.orderItems[n].quantity);
    }
    int paymentPrice = productTotalPrice + 3000;
    var viewModel = context.watch<PaymentViewmodel>();

    // debugPrint("👍👍${widget.orderItems[1].product}");

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
                  PaymentTextField(controller: nameCtrl)
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
                  PaymentTextField(flex: 2, hintText: '우편주소', controller: postCtrl),
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
                  PaymentTextField(hintText: '상세주소', controller: addressCtrl),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 64),
                  PaymentTextField(controller: addressDetailCtrl)
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
                  PaymentTextField(flex: 3, controller: phoneFirstCtrl),
                  SizedBox(width: 14),
                  PaymentTextField(flex: 4, controller: phoneSecondCtrl),
                  SizedBox(width: 14),
                  PaymentTextField(flex: 4, controller: phoneThirdCtrl),
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
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return PaymentListItem(paymentItem: widget.paymentItems[index]);
                  },
                  itemCount: widget.paymentItems.length,

                ),
              ),


              Divider(thickness: 6, color: AppColors.gray100),
              PaymentSpaceBetweenWidget(leftText: '배송비', rightText: '3,000 원'),
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
              PaymentSpaceBetweenWidget(leftText: '주문상품', rightText: '$productTotalPrice원'),
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
                    '$paymentPrice원',
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
              SelectPaymentWidget(),
              Divider(thickness: 1, color: AppColors.textSub),
              SizedBox(height: 24),
              PaymentCheckboxWidget(),
              SizedBox(height: 36),
              BottomCTAButton(
                text: "주문하기",
                onPressed: () async {
                  if(nameCtrl.text == '') {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("받는 사람을 입력하세요.")));
                    return;
                  }
                  if(postCtrl.text == '') {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("우편주소를 입력하세요.")));
                    return;
                  }
                  if(addressCtrl.text == '') {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("주소를 입력하세요.")));
                    return;
                  }
                  if(phoneFirstCtrl.text == '' || phoneSecondCtrl.text == '' || phoneThirdCtrl.text == '') {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("전화번호 입력이 잘못되었습니다.")));
                    return;
                  }
                  if(viewModel.selectedPayment == null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("결제 수단을 선택해 주세요.")));
                    return;
                  }
                  if(viewModel.isChecked == false) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("약관에 동의해야 결제가 가능합니다.")));
                    return;
                  }
                  try {
                    if(await viewModel.doPayment(
                      orderItem: widget.orderItems,
                      recipient: nameCtrl.text,
                      address: "${postCtrl.text} ${addressCtrl.text} ${addressDetailCtrl.text}",
                      phone: "${phoneFirstCtrl.text}-${phoneSecondCtrl.text}-${phoneThirdCtrl.text}",
                      cartIds: widget.cartIds
                    )) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("주문이 완료되었습니다.")));
                      Navigator.pushNamed(context, AppRoutes.home);
                    }
                    else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("주문 요청중 오류가 발생했습니다.")));
                    }
                  }
                  catch(e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("주문 요청중 오류가 발생했습니다.")));
                    debugPrint("$e");
                  }

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
