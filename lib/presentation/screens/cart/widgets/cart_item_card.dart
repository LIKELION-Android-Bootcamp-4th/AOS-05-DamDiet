import 'package:damdiet/data/models/cart/cart_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';
import 'cart_option_row.dart';
import 'cart_price_info.dart';
import 'cart_quantity_control.dart';

class CartItemCard extends StatelessWidget {

  final CartItem item;
  final bool isSelected;
  final Function(String) onToggle;
  final Function(CartItem) onDelete;
  final Function(CartItem, int) onUpdateQuantity;
  final VoidCallback onOptionChange;


  const CartItemCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onToggle,
    required this.onDelete,
    required this.onUpdateQuantity,
    required this.onOptionChange,
  });

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Container(
      width: 308,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40, ),
                    ClipRRect(
                      child: Container(
                          width: 70, height: 70, color: AppColors.gray100,
                          child: Image.network(
                            //TODO 확인
                            "https://dm.pulmuone.com/upload/img/202408/20240808s0SQaD1ri.jpg",
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return SizedBox(
                                width: 70,
                                height: 70,
                                child: Center(child: CircularProgressIndicator()),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                width: 70,
                                height: 70,
                                child: Center(child: Icon(Icons.error)),
                              );
                            },
                          ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textMain,
                                  fontFamily: 'PretendardSemiBold',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CartQuantityControl(
                            quantity: item.quantity,
                            onDecrement: () => onUpdateQuantity(item, item.quantity - 1),
                            onIncrement: () => onUpdateQuantity(item, item.quantity + 1),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CartPriceInfo(item: item),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                if (item.product.options.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CartOptionRow(
                      optionName: item.product.options.entries
                          .map((e) => '${e.key}: ${e.value}')
                          .join(', '),
                    ),
                  ),
                if (item.product.options.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: onOptionChange,
                        icon: const Icon(Icons.add, size: 11),
                        label: const Text('옵션 변경',style: TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium')),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          foregroundColor: AppColors.textSub,
                          side: const BorderSide(color: AppColors.gray200),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) => onToggle(item.id),
              shape: const CircleBorder(),
              activeColor: AppColors.primaryColor,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.close, color: AppColors.textSub, size: 20),
              onPressed: () => onDelete(item),
            ),
          ),
        ],
      ),
    );
  }
}