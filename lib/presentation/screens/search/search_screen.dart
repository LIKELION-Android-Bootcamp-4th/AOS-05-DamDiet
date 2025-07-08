import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/category_constants.dart';
import '../../../core/theme/appcolor.dart';
import '../../../core/widgets/category_outline_button.dart';
import '../../../core/widgets/search_product_textfield.dart';
import '../../provider/price_range_provider.dart';
import '../../routes/app_routes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var priceRange = Provider.of<PriceRangeProvider>(context);
    var controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              SearchProductTextField(controller: controller, isSearched: false),
              SizedBox(height: 28),
              Text(
                "카테고리 별 상품 보기",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  // index: appCategories index
                  CategoryOutlineButton(index: 0),
                  SizedBox(width: 16),
                  CategoryOutlineButton(index: 1),
                  SizedBox(width: 16),
                  CategoryOutlineButton(index: 2),
                  SizedBox(width: 16),
                  CategoryOutlineButton(index: 3),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  CategoryOutlineButton(index: 4),
                  SizedBox(width: 16),
                  CategoryOutlineButton(index: 5),
                  SizedBox(width: 16),
                  CategoryOutlineButton(index: 6)
                ],
              ),

              SizedBox(height: 26),
              Text(
                "가격대 설정",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain
                ),
              ),
              SizedBox(height: 20),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.primaryColor,
                  thumbColor: AppColors.primaryColor,
                ),
                child: RangeSlider(
                  min: 3000,
                  max: 12000,
                  values: priceRange.rangeValues,
                  divisions: 9,
                  labels: RangeLabels(
                    priceRange.rangeValues.start.toString(),
                    priceRange.rangeValues.end.toString(),
                  ),
                  onChanged: (v) => priceRange.changeRangeValues(v),
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
