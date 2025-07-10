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
    imagePath: 'assets/images/damdiet_logo_1.png',
  ),
  AppCategory(
    nameKo: '볶음밥/도시락',
    nameEn: 'meal',
    imagePath: 'assets/images/damdiet_logo_2.png',
  ),
  AppCategory(
    nameKo: '샐러드',
    nameEn: 'salad',
    imagePath: 'assets/images/damdiet_logo_3.png',
  ),
  AppCategory(
    nameKo: '프로틴',
    nameEn: 'protein',
    imagePath: 'assets/images/damdiet_logo_4.png',
  ),
  AppCategory(
    nameKo: '간식',
    nameEn: 'snack',
    imagePath: 'assets/images/damdiet_logo_5.png',
  ),
  AppCategory(
    nameKo: '음료',
    nameEn: 'beverage',
    imagePath: 'assets/images/damdiet_logo_6.png',
  ),
  AppCategory(
    nameKo: '건강/뷰티',
    nameEn: 'health',
    imagePath: 'assets/images/damdiet_logo_7.png',
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