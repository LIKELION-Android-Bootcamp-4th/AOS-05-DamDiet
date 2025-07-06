class ProductNutrition {
  final int calories;
  final int carbs;
  final int fat;
  final int protein;

  const ProductNutrition({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  factory ProductNutrition.fromJson(Map<String, dynamic> json) {
    return ProductNutrition(
      calories: json['calories'] as int,
      carbs: json['carbs'] as int,
      fat: json['fat'] as int,
      protein: json['protein'] as int,
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
