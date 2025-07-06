import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class CartHeader extends StatelessWidget {
  final bool isAllSelected;
  final int selectedItemCount;
  final int totalCount;
  final VoidCallback onToggleAll;
  final VoidCallback onDeleteSelected;

  const CartHeader({
    super.key,
    required this.isAllSelected,
    required this.selectedItemCount,
    required this.totalCount,
    required this.onToggleAll,
    required this.onDeleteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Checkbox(
            value: isAllSelected,
            onChanged: (_) => onToggleAll(),
            shape: const CircleBorder(),
            activeColor: AppColors.primaryColor,
          ),
          Text('전체 선택 ($selectedItemCount/$totalCount)', style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium')),
          const Spacer(),
          GestureDetector(
            onTap: onDeleteSelected,
            child: const Text('상품 삭제', style: TextStyle(fontSize: 12, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
          ),
        ],
      ),
    );
  }
}
