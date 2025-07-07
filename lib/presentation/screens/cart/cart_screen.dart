import 'package:damdiet/core/widgets/damdiet_appbar.dart';
import 'package:damdiet/presentation/screens/cart/cart_view_model.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_empty_view.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_header.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_item_card.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_order_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CartViewModel>().fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '장바구니',
        showBackButton: false,
      ),
      body: Column(
        children: [
          if (viewModel.cart != null && viewModel.cart!.items.isNotEmpty)
            CartHeader(
              isAllSelected: viewModel.isAllSelected(),
              selectedItemCount: viewModel.selectedItemIds.length,
              totalCount: viewModel.cart!.items.length,
              onToggleAll: () => viewModel.toggleAllSelection(!viewModel.isAllSelected()),
              onDeleteSelected: viewModel.deleteSelectedItems,
            ),
          Expanded(
            child: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : (viewModel.cart == null || viewModel.cart!.items.isEmpty)
                ? const CartEmptyView()
                : ListView.builder(
              itemCount: viewModel.cart!.items.length,
              itemBuilder: (context, index) {
                final item = viewModel.cart!.items[index];
                return CartItemCard(
                  item: item,
                  isSelected: viewModel.selectedItemIds.contains(item.id),
                  onToggle: viewModel.toggleItemSelection,
                  onDelete: (selectedItem) {
                    viewModel.deleteSelectedItems();
                  },
                  onUpdateQuantity: (selectedItem, newQuantity) {
                    viewModel.updateQuantity(selectedItem, newQuantity);
                  },
                  onOptionChange: () {
                  },
                );
              },
            ),
          ),
          if (viewModel.cart != null)
            CartOrderSummary(
              selectedItemCount: viewModel.selectedItemIds.length,
              totalAmount: viewModel.cart!.totalAmount,
            ),
        ],
      ),
    );
  }
}