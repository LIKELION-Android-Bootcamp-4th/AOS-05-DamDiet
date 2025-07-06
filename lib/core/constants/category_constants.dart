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
    nameEn: 'electronics',
    imagePath: 'assets/images/damdiet_logo_1.png',
  ),
  AppCategory(
    nameKo: '볶음밥/도시락',
    nameEn: 'fashion',
    imagePath: 'assets/images/damdiet_logo_2.png',
  ),
  AppCategory(
    nameKo: '샐러드',
    nameEn: 'appliances',
    imagePath: 'assets/images/damdiet_logo_3.png',
  ),
  AppCategory(
    nameKo: '프로틴',
    nameEn: 'appliances',
    imagePath: 'assets/images/damdiet_logo_4.png',
  ),
  AppCategory(
    nameKo: '간식',
    nameEn: 'appliances',
    imagePath: 'assets/images/damdiet_logo_5.png',
  ),
  AppCategory(
    nameKo: '음료',
    nameEn: 'appliances',
    imagePath: 'assets/images/damdiet_logo_6.png',
  ),
  AppCategory(
    nameKo: '건강/뷰티',
    nameEn: 'appliances',
    imagePath: 'assets/images/damdiet_logo_7.png',
  ),
];