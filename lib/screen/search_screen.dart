import 'package:damdiet/provider/price_range_provider.dart';
import 'package:damdiet/routes/app_routes.dart';
import 'package:damdiet/widgets/category_outline_button.dart';
import 'package:damdiet/widgets/search_product_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../util/appcolor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var priceRange = Provider.of<PriceRangeProvider>(context);
    var controller = TextEditingController();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            SearchProductTextField(controller: controller),
            SizedBox(height: 28),
            Text(
              "카테고리 별 상품 보기",
              style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold'),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CategoryOutlineButton(text: "닭가슴살"),
                SizedBox(width: 12),
                CategoryOutlineButton(text: '볶음밥/도시락'),
                SizedBox(width: 12),
                CategoryOutlineButton(text: "샐러드"),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CategoryOutlineButton(text: "간식/음료"),
                SizedBox(width: 12),
                CategoryOutlineButton(text: '건강/뷰티'),
                SizedBox(width: 12),
                CategoryOutlineButton(text: "운동용품"),
              ],
            ),

            SizedBox(height: 26),
            Text(
              "가격대 설정",
              style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold'),
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
                  priceRange.rangeValues.end.toString()
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
    );
  }
}
