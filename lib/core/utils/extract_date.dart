import 'package:intl/intl.dart';

String extractDate(String isoString) {
  final dateTime = DateTime.tryParse(isoString);
  if (dateTime == null) return isoString;

  return DateFormat('yyyy-MM-dd').format(dateTime);
}
