import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../presentation/provider/search_provider.dart';
import '../../presentation/routes/app_routes.dart';

class SearchProductTextField extends StatefulWidget {
  const SearchProductTextField({super.key, required this.controller, this.isSearched = true});

  final TextEditingController controller;
  final bool isSearched;

  @override
  State<SearchProductTextField> createState() => _SearchProductTextFieldState();
}

class _SearchProductTextFieldState extends State<SearchProductTextField> {

  @override
  Widget build(BuildContext context) {
    var search = Provider.of<SearchProvider>(context);

    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.gray100,
        contentPadding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide.none
        ),
        suffixIcon: IconButton(
          onPressed: () async {
            if(widget.controller.text == "") {
              Fluttertoast.showToast(msg: '상품명을 입력하세요.');
              return;
            }

            search.searchProducts();
            if(widget.isSearched == false) {
              Navigator.pushNamed(context, AppRoutes.products);
            }
          },
          icon: SvgPicture.asset('assets/icons/ic_search_outline.svg'),
        ),
      ),
      onChanged: (value) {
        search.setProductName(widget.controller.text);
      },
    );
  }
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

}
