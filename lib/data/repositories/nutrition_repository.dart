import 'package:damdiet/data/datasource/nutrition_dataresource.dart';

import '../models/kcal/product_nutrition.dart';

class NutritionRepository {
  final NutritionDataResource _dataResource;

  NutritionRepository(this._dataResource);

  Future<List<ProductNutrition>> searchNutrition(String foodName, String? company) async {
    final response = await _dataResource.searchNutrition(foodName, company);

    return response.items;
  }
}