import 'package:damdiet/data/datasource/order_datasource.dart';
import 'package:damdiet/data/models/order/my_order_item.dart';
import 'package:damdiet/data/models/order/order_item.dart';

class OrderRepository {
  final OrderDataSource _dataSource;

  OrderRepository(this._dataSource);

  Future<List<MyOrderItem>> getOrders() async {
    final response = await _dataSource.getOrders();

    if (!response.success) {
      throw Exception('주문 목록을 불러오는데 실패했습니다: ${response.message}');
    }

    return response.data.items;
  }
}
