import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  if (price >= 1000000) return "${formatter.format(price ~/ 1000000)}M원";
  return "${formatter.format(price)}원";
}
