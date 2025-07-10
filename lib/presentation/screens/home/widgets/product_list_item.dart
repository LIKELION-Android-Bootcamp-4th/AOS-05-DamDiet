import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../data/models/product/product.dart';
import '../../../routes/app_routes.dart';


class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        debugPrint("😇 ${product.id }");
        Navigator.pushNamed(
          context,
          AppRoutes.productDetail,
          arguments: product.id,
        );
      },
      child: Container(
        width: 100,
        height: 150,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:
              Image.network(
                product.image,
                width: 100,
                height: 100,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: Icon(Icons.error)),
                  );
                },
              ),
            ),
            SizedBox(height: 4),
            Text(
              product.name,
              style: TextStyle(
                fontFamily: 'PretendardMedium',
                fontSize: 14,
                color: AppColors.textMain,

              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (product.discount > 0) ...[
                      Text(
                        "${product.discount}%",
                        style: TextStyle(
                          fontFamily: 'PretendardBold',
                          fontSize: 14,
                          color: AppColors.errorRed,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        formatPrice((product.price * (100 - product.discount) / 100).toInt()),
                        style: TextStyle(
                          fontFamily: 'PretendardMedium',
                          fontSize: 14,
                          color: AppColors.textSub,
                        ),
                      ),
                    ] else
                      Text(
                        formatPrice(product.price),
                        style: TextStyle(
                          fontFamily: 'PretendardMedium',
                          fontSize: 14,
                          color: AppColors.textSub,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
