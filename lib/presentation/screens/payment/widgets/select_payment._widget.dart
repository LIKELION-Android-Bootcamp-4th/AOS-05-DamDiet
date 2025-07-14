import 'package:damdiet/presentation/screens/payment/payment_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/payment_constants.dart';
import '../../../../core/widgets/category_outline_button.dart';
import '../../../../core/widgets/outline_chip_group.dart';

class SelectPaymentWidget extends StatefulWidget {
  const SelectPaymentWidget({super.key});

  @override
  State<SelectPaymentWidget> createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<PaymentViewmodel>();
    return OutlineChipGridGroup(
      labels: PaymentCategory.paymentCategories,
      values: PaymentCategory.paymentCategories,
      selectedValue: selectedPayment,
      onSelected: (value) {
        setState(() {
          selectedPayment = value;
        });
        viewModel.changePayment(value);
      },
    );
  }
}
