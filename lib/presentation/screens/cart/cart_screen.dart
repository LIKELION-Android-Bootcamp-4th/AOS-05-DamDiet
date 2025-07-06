import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../../core/theme/appcolor.dart';
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('This is Cart Screen.'),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AppRoutes.payment);
//             },
//             child: Text("결제 창 이동"),
//           ),
//         ],
//       ),
//     );
//   }
// }
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
      CartItem(id: 1, name: "담다잇 닭가슴살 블랙페퍼", quantity: 2, originalPrice: 10000, discountRate: 0.3),
      CartItem(id: 2, name: "담다잇 닭가슴살", optionName: "볼케이노 맛", quantity: 1, originalPrice: 20000, discountRate: 0.3),
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

  bool get _isAllSelected => _cartItems.isNotEmpty && _cartItems.every((item) => item.isChecked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'PretendardBold')),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          if(_cartItems.isNotEmpty) _buildCartHeader(),
          Expanded(
            child: _cartItems.isEmpty
                ? _buildEmptyCartView()
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return _buildCartItemCard(item);
              },
            ),
          ),
          _buildOrderSummary(),
        ],
      ),
    );
  }

  Widget _buildEmptyCartView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('😢', style: TextStyle(fontSize: 96)),
          SizedBox(height: 18),
          Text('장바구니가 비어있어요', style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
          SizedBox(height: 8),
          Text('상품을 담아주세요!', style: TextStyle(fontSize: 14, color: AppColors.textSub, fontFamily: 'PretendardSemiBold')),
        ],
      ),
    );
  }

  Widget _buildCartHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: _isAllSelected,
            onChanged: _toggleAllSelection, // 전체 선택
            shape: const CircleBorder(),
            activeColor: AppColors.primaryColor,
          ),
          Text('전체 선택 ($_selectedItemCount/${_cartItems.length})', style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium')),
          const Spacer(),
          GestureDetector(
            onTap: _deleteSelectedItems, // 선택 삭제
            child: const Text('상품 삭제', style: TextStyle(fontSize: 12, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(CartItem item) {
    return Container(
      width: 308,
      margin: const EdgeInsets.only(bottom: 12),
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
                    const SizedBox(width: 48, ),
                    ClipRRect(
                      child: Container(
                          width: 70, height: 70, color: AppColors.gray100,
                          child: const Icon(Icons.image, color: AppColors.gray200, size: 55)
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(item.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
                          const SizedBox(height: 8),
                          _buildQuantityControl(
                            quantity: item.quantity,
                            onDecrement: () => _updateQuantity(item, -1), // 수량 감소/증가
                            onIncrement: () => _updateQuantity(item, 1),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: _buildPriceInfo(item),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                if (item.optionName != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: _buildOptionRow(item.optionName!),
                  ),
                if (item.optionName != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _showOptionChangeSheet(context), // 바텀시트
                        icon: const Icon(Icons.add, size: 11),
                        label: const Text('옵션 변경',style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium')),
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
              value: item.isChecked,
              onChanged: (value) => _toggleItemSelection(item, value),
              shape: const CircleBorder(),
              activeColor: AppColors.primaryColor,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.close, color: AppColors.textSub, size: 20),
              onPressed: () => _deleteSingleItem(item),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(String optionName) {
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

  Widget _buildPriceInfo(CartItem item) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('${item.originalPrice * item.quantity}원', style: const TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
          const SizedBox(height: 1),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(item.discountRate * 100).toInt()}%', style: const TextStyle(fontSize: 14, color: AppColors.errorRed, fontFamily: 'PretendardBold')),
              const SizedBox(width: 8),
              Text('${item.subtotal}원', style: const TextStyle(fontSize: 12, color: AppColors.textMain, fontFamily: 'PretendardMedium')),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuantityControl({required int quantity, required VoidCallback onDecrement, required VoidCallback onIncrement}) {
    return Container(
      width: 76,
      height: 22,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: onDecrement, child: const Icon(Icons.remove, size: 16, color: AppColors.textSub)),
          Text('$quantity', style: const TextStyle(fontSize: 12, color: AppColors.textMain, fontFamily: 'PretendardMedium')),
          InkWell(onTap: onIncrement, child: const Icon(Icons.add, size: 16, color: AppColors.textSub)),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).padding.bottom + 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('주문금액', style: TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
                  const SizedBox(width: 8),
                  Text('$_selectedItemCount건', style: const TextStyle(fontSize: 14, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
                ],
              ),
              Text('$_totalAmount원', style: const TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
            ],
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {
               Navigator.pushNamed(context, AppRoutes.payment);
             },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: const Text('주문하기', style: TextStyle(fontSize: 16, fontFamily: 'PretendardSemiBold', color: Colors.white)),
          ),
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
        padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(ctx).padding.bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 70, height: 70, color: AppColors.gray100,
                  child: const Icon(Icons.image, color: AppColors.gray200, size: 30),
                ),
                const SizedBox(width: 12,),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                      children: [
                        const Text("담다잇 닭가슴살", style: TextStyle(fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
                      ]
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: '볼케이노 맛', child: Text('볼케이노 맛', style : TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardMedium'))),
                DropdownMenuItem(value: '블랙페퍼 맛', child: Text('블랙페퍼 맛', style : TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardMedium'))),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.gray200)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: const BorderSide(color: AppColors.gray200)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              hint: const Text('옵션을 선택하세요', style: TextStyle(fontSize: 12, color: AppColors.textHint, fontFamily: 'PretendardRegular')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(308, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('변경하기', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    },
  );
}