import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class CartOptionChangeSheet extends StatelessWidget {
  final String productName;
  final String productImageUrl;
  final List<String> optionList;
  final ValueChanged<String> onOptionSelected;

  const CartOptionChangeSheet({
    super.key,
    required this.productName,
    required this.productImageUrl,
    required this.optionList,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.of(context).padding.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, size: 40, color: AppColors.gray200),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontFamily: 'PretendardSemiBold',
                    fontSize: 16,
                    color: AppColors.textMain,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          StatefulBuilder(
            builder: (context, setState) {
              return DropdownButtonFormField<String>(
                value: selectedOption,
                items: optionList
                    .map(
                      (option) => DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textMain,
                        fontFamily: 'PretendardMedium',
                      ),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.gray200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.gray200),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  hintText: '옵션을 선택하세요',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                    fontFamily: 'PretendardRegular',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: selectedOption == null
                ? null
                : () {
              onOptionSelected(selectedOption!);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text(
              '변경하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
