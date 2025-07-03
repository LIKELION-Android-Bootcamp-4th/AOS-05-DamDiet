import 'package:damdiet/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/appcolor.dart';

class CategoryOutlineButton extends StatefulWidget {
  const CategoryOutlineButton({super.key, required this.text});

  final String text;

  @override
  State<CategoryOutlineButton> createState() => _CategoryOutlineButtonState();
}

class _CategoryOutlineButtonState extends State<CategoryOutlineButton> {
  bool _selectedState = false;

  @override
  Widget build(BuildContext context) {
    var search = Provider.of<SearchProvider>(context);
    return OutlinedButton(
      style: _setButtonState(),
      onPressed: () {
        setState(() {
          _selectedState = !_selectedState;
          if(_selectedState) {
            search.addCategory(widget.text);
          } else  {
            search.removeCategory(widget.text);
          }
        });
      },
      child: Text(widget.text,
        style: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium')
      ),
    );
  }

  ButtonStyle _setButtonState() {
    if(_selectedState) {
      return OutlinedButton.styleFrom(
        padding: EdgeInsets.all(14.0),
        foregroundColor: AppColors.primaryColor,
        side: BorderSide(color: AppColors.primaryColor),
        textStyle: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium')
      );
    }
    else {
      return OutlinedButton.styleFrom(
        padding: EdgeInsets.all(14.0),
        foregroundColor: AppColors.textHint,
        side: BorderSide(color: AppColors.textHint),
        textStyle: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium')
      );
    }

  }
}
