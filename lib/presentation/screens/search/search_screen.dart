import 'package:damdiet/core/constants/category_constants.dart';
import 'package:damdiet/presentation/screens/search/search_viewmodel.dart';
import 'package:damdiet/core/widgets/outline_chip_group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/appcolor.dart';
import '../../../core/widgets/category_outline_button.dart';
import '../../../core/widgets/search_product_textfield.dart';
import '../../routes/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              SearchProductTextField(
                controller: controller,
                isSearched: false,
                onChanged: (value) {
                  viewModel.setProductName(value);
                },
                onSearch: () async {
                  await viewModel.searchProducts();
                  Navigator.pushNamed(context, AppRoutes.products);
                },
              ),

              const SizedBox(height: 28),
              const Text(
                "카테고리 별 상품 보기",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 18),
              OutlineChipGroup(
                labels: appCategories.map((e) => e.nameKo).toList(),
                values: appCategories.map((e) => e.nameEn).toList(),
                selectedValue: viewModel.selectedCategory, // nameEn
                onSelected: (value) {
                  viewModel.setCategory(value!);
                },
              ),
              const SizedBox(height: 26),
              const Text(
                "가격대 설정",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 20),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.primaryColor,
                  thumbColor: AppColors.primaryColor,
                ),
                child: RangeSlider(
                  min: 3000,
                  max: 12000,
                  values: viewModel.rangeValues,
                  divisions: 9,
                  labels: RangeLabels(
                    viewModel.rangeValues.start.toString(),
                    viewModel.rangeValues.end.toString(),
                  ),
                  onChanged: (v) => viewModel.changeRangeValues(v),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.products);
                },
                child: Text("검색 결과"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
