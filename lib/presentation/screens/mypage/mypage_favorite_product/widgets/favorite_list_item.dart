import 'package:damdiet/models/FavoriteProduct.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class FavoriteListItem extends StatefulWidget {
  const FavoriteListItem({super.key, required this.favoriteProduct, required this.onRemove, required this.onTap});

  final FavoriteProduct favoriteProduct;
  final VoidCallback onRemove;
  final VoidCallback onTap;


  @override
  State<FavoriteListItem> createState() => _FavoriteListItemState();
}

class _FavoriteListItemState extends State<FavoriteListItem> {
  bool isFavorite = true;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favoriteProduct.product.isFavorite ?? true;
  }

  // TODO: 이건 그냥 껐다 켰다 ver 현재 구현은 누르면 바로 삭제되게 해둠
  // void toggleFavorite() {
  //   setState(() {
  //     isFavorite = !isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          widget.onTap();
        },
        child:  Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: IconButton(
                      icon: Icon(
                        //TODO 로직 확정하면 여기도 그냥 켜진 상태만 있어도 될듯
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? AppColors.errorRed : Colors.grey,
                      ),
                      onPressed: (){widget.onRemove();},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                widget.favoriteProduct.product.name!,
                style: TextStyle(
                    fontFamily: 'PretendardSemiBold',
                    fontSize: 14,
                    color: AppColors.textMain
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    '30%',
                    style: TextStyle(
                        fontFamily: 'PretendardBold',
                        fontSize: 14,
                        color: AppColors.errorRed
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.favoriteProduct.product.price!} 원',
                    style: TextStyle(
                      fontFamily: 'PretendardMedium',
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}
