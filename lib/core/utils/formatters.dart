import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  if (price >= 1000000) return "${formatter.format(price ~/ 1000000)}M 원";
  if (price >= 10000) return "${formatter.format(price ~/ 10000)}만 원";
  return "${formatter.format(price)} 원";
}
