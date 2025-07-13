class AppCategory {
  final String nameKo; // 표시용 한글
  final String nameEn; // 쿼리/API 용
  final String imagePath; // 앱 내부 asset 경로

  const AppCategory({
    required this.nameKo,
    required this.nameEn,
    required this.imagePath,
  });
}

const List<AppCategory> appCategories = [
  AppCategory(
    nameKo: '닭가슴살',
    nameEn: 'chicken',
    imagePath: 'assets/images/cat_chicken.png',
  ),
  AppCategory(
    nameKo: '볶음밥/도시락',
    nameEn: 'meal',
    imagePath: 'assets/images/cat_meal.png',
  ),
  AppCategory(
    nameKo: '샐러드',
    nameEn: 'salad',
    imagePath: 'assets/images/cat_salad.png',
  ),
  AppCategory(
    nameKo: '프로틴',
    nameEn: 'protein',
    imagePath: 'assets/images/cat_protein.png',
  ),
  AppCategory(
    nameKo: '간식',
    nameEn: 'snack',
    imagePath: 'assets/images/cat_snack.png',
  ),
  AppCategory(
    nameKo: '음료',
    nameEn: 'beverage',
    imagePath: 'assets/images/cat_beverage.png',
  ),
  AppCategory(
    nameKo: '건강/뷰티',
    nameEn: 'health',
    imagePath: 'assets/images/cat_health.png',
  ),
];

final Map<String, AppCategory> _categoryMap = {
  for (final cat in appCategories) cat.nameEn: cat,
};

extension AppCategoryExtension on String {
  String toKoCategory() {
    return _categoryMap[this]!.nameKo;
  }
}