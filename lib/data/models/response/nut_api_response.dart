import 'package:damdiet/data/models/kcal/nut_api_item.dart';

class NutApiResponse {
  final int pageNo;
  final int totalCount;
  final int numOfRows;
  final List<NutApiItem> items;


  NutApiResponse({
    required this.pageNo,
    required this.totalCount,
    required this.numOfRows,
    required this.items,
  });

  factory NutApiResponse.fromJson(Map<String, dynamic> json) {
    return NutApiResponse(
        pageNo: json['body']['pageNo'],
        totalCount: json['body']['totalCount'],
        numOfRows: json['body']['numOfRows'],
        items: (json['body']['items'] as List)
            .map((e) => NutApiItem.fromJson(e))
            .toList()
    );
  }
}