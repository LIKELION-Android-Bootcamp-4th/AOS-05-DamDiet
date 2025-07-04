import 'package:damdiet/widgets/category_outline_button.dart';
import 'package:flutter/material.dart';

class SelectPaymentWidget extends StatefulWidget {
  const SelectPaymentWidget({super.key});

  @override
  State<SelectPaymentWidget> createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(text: '신용카드')
              ),
              SizedBox(width: 16),
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(text: '무통장입금')
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(text: '카카오페이')
              ),
              SizedBox(width: 16),
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(text: '토스')
              ),
            ],
          )

        ],
      ),
    );
  }
}
