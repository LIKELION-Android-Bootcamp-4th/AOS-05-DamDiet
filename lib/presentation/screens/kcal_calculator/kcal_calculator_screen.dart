import 'package:damdiet/models/ProductNutrition.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_viewmodel.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/widgets/kcal_checked_list.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/widgets/kcal_listview_item.dart';
import 'package:damdiet/presentation/screens/auth/widgets/custom_textfield.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/bottom_cta_button.dart';
import '../../../core/widgets/damdiet_appbar.dart';
import '../../provider/nutrition_provider.dart';

class KcalCalculatorScreen extends StatefulWidget {
  const KcalCalculatorScreen({super.key});

  @override
  State<KcalCalculatorScreen> createState() => _KcalCalculatorScreenState();
}

class _KcalCalculatorScreenState extends State<KcalCalculatorScreen> {
  var searchProductNutList = [
    ProductNutrition(name: '신라면', company: '농심', calorie: 1000),
    ProductNutrition(name: '진라면', company: '오뚜기', calorie: 1000),
    ProductNutrition(name: '신라면', company: '농심', ),
  ];

  var productTextController = TextEditingController();
  var companyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var nutrition = Provider.of<NutritionProvider>(context);
    var viewModel = context.watch<KcalCalculatorViewmodel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '칼로리계산기',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomTextField(hintText: '음식 명', controller: productTextController),
                            SizedBox(height: 8),
                            CustomTextField(hintText: '제조사 명', controller: companyTextController),
                          ],
                        ),
                      ),
                      SizedBox(width: 14),
                      IconButton(
                        onPressed: () {
                          viewModel.searchFood(
                            productTextController.text, companyTextController.text
                          );
                        },
                        icon: SvgPicture.asset('assets/icons/ic_search_fill.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 6, color: AppColors.gray100),

                  Text(
                    '검색결과',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardSemiBold',
                      color: AppColors.textMain,
                    ),
                  ),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return KcalListviewItem(
                          name: viewModel.searchedFoodList[index].product,
                          company: viewModel.searchedFoodList[index].company,
                          calorie: viewModel.searchedFoodList[index].calorie,
                          /*name: searchProductNutList[index].name,
                          company: searchProductNutList[index].company,
                          calorie: searchProductNutList[index].calorie,*/
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(thickness: 1, color: AppColors.textSub),
                      itemCount: viewModel.searchedFoodList.length,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ),
                  Divider(thickness: 6, color: AppColors.gray100),
                  Text(
                    '칼로리계산',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PretendardSemiBold',
                      color: AppColors.textMain,
                    ),
                  ),
                  Divider(thickness: 1, color: AppColors.textSub),
                  KcalCheckedList(),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '계산된 칼로리 양은 ${nutrition.selectedCalSum} kcal 입니다.',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PretendardSemiBold',
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              BottomCTAButton(text: '커뮤니티에 공유', onPressed: () {}),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("뒤로 가기"),
              ),
            ],
          ),
        ),

      )

    );
  }
}
