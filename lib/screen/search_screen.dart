import 'package:damdiet/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/appcolor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/ic_search_outline.svg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 28),
          Text("카테고리 별 상품 보기", style: TextStyle(fontSize: 14)),
          SizedBox(height: 18),
          Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(12.0)
                  ),
                    onPressed: () {},
                    child: Text("닭가슴살")
                ),
                SizedBox(width: 12),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(12.0)
                    ),
                    onPressed: () {},
                    child: Text("볽음밥/도시락")
                ),
                SizedBox(width: 12),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(12.0)
                    ),
                    onPressed: () {},
                    child: Text("샐러드")
                ),
              ]
          ),

          SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {} ,
            style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(color: AppColors.primaryColor)
            ),
            child: Text("닭가슴살"),
          ),
          SizedBox(height: 26),
          Text("가격대 설정", style: TextStyle(fontSize: 14)),
          SizedBox(height: 20),
          RangeSlider(
              min: 3000,
              max: 12000,
              values: RangeValues(5000, 10000),
              divisions: 6,
              labels: RangeLabels('5000', '10000'),
              onChanged: (RangeValues newValues) {}
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.products);
            },
            child: Text("검색 결과"),
          ),
        ],
      ),
    );
  }
}
