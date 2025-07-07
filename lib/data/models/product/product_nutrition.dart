class ProductNutrition {
  final String calories;
  final String carbs;
  final String fat;
  final String protein;

  const ProductNutrition({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  factory ProductNutrition.fromJson(Map<String, dynamic> json) {
    return ProductNutrition(
      calories: json['calories']?.toString() ?? '',
      carbs: json['carbs']?.toString() ?? '',
      fat: json['fat']?.toString() ?? '',
      protein: json['protein']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
    };
  }
}
