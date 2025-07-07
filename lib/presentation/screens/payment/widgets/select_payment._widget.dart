import 'package:flutter/material.dart';

import '../../../../core/widgets/category_outline_button.dart';

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
                  child: CategoryOutlineButton(index: 11)
              ),
              SizedBox(width: 16),
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(index: 12)
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(index: 13)
              ),
              SizedBox(width: 16),
              Expanded(
                  flex: 1,
                  child: CategoryOutlineButton(index: 14)
              ),
            ],
          )

        ],
      ),
    );
  }
}
