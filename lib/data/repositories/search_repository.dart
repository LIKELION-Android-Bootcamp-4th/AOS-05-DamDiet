import '../models/product/product.dart';
import '../datasource/search_service.dart';

class SearchRepository {
  final SearchService _searchService;
  SearchRepository(this._searchService);

  Future<List<Product>> getSearchedProducts(String productName) async {
    final response = await _searchService.searchProducts(productName);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

}