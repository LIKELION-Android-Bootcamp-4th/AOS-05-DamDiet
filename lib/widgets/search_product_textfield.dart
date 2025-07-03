import 'package:damdiet/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchProductTextField extends StatefulWidget {
  const SearchProductTextField({super.key, required this.controller});

  final TextEditingController controller;

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
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide.none
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/ic_search_outline.svg'),
        ),
      ),
      onChanged: (value) {
        search.setProductName(widget.controller.text);
      },
    );
  }
}
