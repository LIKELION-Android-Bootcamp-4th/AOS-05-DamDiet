import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class CartOptionRow extends StatelessWidget {
  final String optionName;

  const CartOptionRow({super.key, required this.optionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          const Divider(height: 1, color: AppColors.gray100,),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(optionName, style: const TextStyle(fontSize: 14, color: AppColors.textSub, fontFamily: 'PretendardMedium')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
