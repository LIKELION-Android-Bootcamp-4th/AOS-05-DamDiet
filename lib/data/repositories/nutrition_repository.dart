import 'package:damdiet/data/datasource/nutrition_datasource.dart';

import '../models/kcal/product_nutrition.dart';

class NutritionRepository {
  final NutritionDataSource _dataResource;

  NutritionRepository(this._dataResource);

  Future<List<ProductNutrition>> searchNutrition(String foodName, String? company) async {
    final response = await _dataResource.searchNutrition(foodName, company);

    return response.items;
  }
}