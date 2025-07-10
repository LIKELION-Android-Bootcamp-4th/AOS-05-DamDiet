import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../presentation/provider/search_provider.dart';
import '../../presentation/routes/app_routes.dart';

class SearchProductTextField extends StatefulWidget {
  const SearchProductTextField({super.key, required this.controller, this.isSearched = true, required this.onChanged, required this.onSearch});

  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onSearch;

  final bool isSearched;

  @override
  State<SearchProductTextField> createState() => _SearchProductTextFieldState();
}

class _SearchProductTextFieldState extends State<SearchProductTextField> {

  @override
  Widget build(BuildContext context) {

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
            widget.onChanged(widget.controller.text);
            widget.onSearch();
          },
          icon: SvgPicture.asset('assets/icons/ic_search_outline.svg'),
        ),
      ),
      onChanged: (value) {
      },
    );
  }
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

}
