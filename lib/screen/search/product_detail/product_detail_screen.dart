import 'package:damdiet/screen/search/product_detail/widgets/product_detail_main_info.dart';
import 'package:damdiet/screen/search/product_detail/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_routes.dart';
import '../../../util/appcolor.dart';
import '../../../widgets/underline_text.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/ic_arrow_back.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(),
            ProductDetailMainInfo(),
            Divider(height: 6, color: AppColors.gray100, thickness: 6,),
            Text('This is Product Detail Screen.'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("뒤로 가기"),
            ),
          ],
        ),
      ),
    );
  }
}
