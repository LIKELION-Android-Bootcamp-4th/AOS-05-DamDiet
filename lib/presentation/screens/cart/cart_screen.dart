import 'package:damdiet/presentation/screens/cart/widgets/cart_empty_view.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_header.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_item_card.dart';
import 'package:damdiet/presentation/screens/cart/widgets/cart_order_summary.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/appcolor.dart';

class CartItem {
  final int id;
  final String name;
  final String? optionName;
  int quantity;
  final int originalPrice;
  final double discountRate;
  bool isChecked;

  CartItem({
    required this.id,
    required this.name,
    this.optionName,
    required this.quantity,
    required this.originalPrice,
    required this.discountRate,
    this.isChecked = true,
  });

  int get discountedPrice => (originalPrice * (1 - discountRate)).toInt();

  int get subtotal => discountedPrice * quantity;
}


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<CartItem> _cartItems = [];
  int _selectedItemCount = 0;
  int _totalAmount = 0;

  @override
  void initState() {
    super.initState();
    // 초기 목업 데이터 설정
    _initializeMockData();
    // 초기 금액 계산
    _calculateTotals();
  }

  // --- 상태 관리 로직 ---

  void _initializeMockData() {
    _cartItems = [
      CartItem(id: 1,
          name: "담다잇 닭가슴살 블랙페퍼",
          quantity: 2,
          originalPrice: 10000,
          discountRate: 0.3),
      CartItem(id: 2,
          name: "담다잇 닭가슴살",
          optionName: "볼케이노 맛",
          quantity: 1,
          originalPrice: 20000,
          discountRate: 0.3),
    ];
  }

  // 전체 선택/해제
  void _toggleAllSelection(bool? isSelected) {
    if (isSelected == null) return;
    setState(() {
      for (var item in _cartItems) {
        item.isChecked = isSelected;
      }
      _calculateTotals();
    });
  }

  // 상품 선택/해제
  void _toggleItemSelection(CartItem item, bool? isSelected) {
    if (isSelected == null) return;
    setState(() {
      item.isChecked = isSelected;
      _calculateTotals();
    });
  }

  // 선택된 상품 삭제
  void _deleteSelectedItems() {
    setState(() {
      _cartItems.removeWhere((item) => item.isChecked);
      _calculateTotals();
    });
  }

  // 상품 삭제 (X 버튼)
  void _deleteSingleItem(CartItem item) {
    setState(() {
      _cartItems.remove(item);
      _calculateTotals();
    });
  }

  // 수량 변경
  void _updateQuantity(CartItem item, int change) {
    setState(() {
      if (item.quantity + change >= 1) {
        item.quantity += change;
        _calculateTotals();
      }
    });
  }

  // 주문금액 및 상품 건수
  void _calculateTotals() {
    int count = 0;
    int total = 0;
    for (var item in _cartItems) {
      if (item.isChecked) {
        count++;
        total += item.subtotal;
      }
    }
    _selectedItemCount = count;
    _totalAmount = total;
  }

  bool get _isAllSelected =>
      _cartItems.isNotEmpty && _cartItems.every((item) => item.isChecked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니', style: TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'PretendardBold')),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          if(_cartItems.isNotEmpty) CartHeader(isAllSelected: _isAllSelected,
              selectedItemCount: _selectedItemCount,
              totalCount: _cartItems.length,
              onToggleAll: () => _toggleAllSelection(!_isAllSelected),
              onDeleteSelected: _deleteSelectedItems),
          Expanded(
            child: _cartItems.isEmpty
                ? CartEmptyView()
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return CartItemCard(
                  item: item,
                  onToggle: _toggleItemSelection,
                  onDelete: _deleteSingleItem,
                  onUpdateQuantity: _updateQuantity,
                  onOptionChange: () => _showOptionChangeSheet(context),
                );
              },
            ),
          ),
          CartOrderSummary(
              selectedItemCount: _selectedItemCount, totalAmount: _totalAmount),
        ],
      ),
    );
  }
}

//옵션 추가 바텀시트
void _showOptionChangeSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery
            .of(ctx)
            .padding
            .bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 70, height: 70, color: AppColors.gray100,
                  child: const Icon(
                      Icons.image, color: AppColors.gray200, size: 30),
                ),
                const SizedBox(width: 12,),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                      children: [
                        const Text("담다잇 닭가슴살", style: TextStyle(
                            fontFamily: 'PretendardSemiBold',
                            color: AppColors.textMain)),
                      ]
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: '볼케이노 맛',
                    child: Text('볼케이노 맛', style: TextStyle(fontSize: 14,
                        color: AppColors.textMain,
                        fontFamily: 'PretendardMedium'))),
                DropdownMenuItem(value: '블랙페퍼 맛',
                    child: Text('블랙페퍼 맛', style: TextStyle(fontSize: 14,
                        color: AppColors.textMain,
                        fontFamily: 'PretendardMedium'))),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.gray200)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: AppColors.gray200)),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
              hint: const Text('옵션을 선택하세요', style: TextStyle(fontSize: 12,
                  color: AppColors.textHint,
                  fontFamily: 'PretendardRegular')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(308, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('변경하기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    },
  );
}