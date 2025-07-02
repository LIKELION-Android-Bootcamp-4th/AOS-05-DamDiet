import 'package:flutter/material.dart';

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
    return OutlinedButton(
      style: _setButtonState(),
      onPressed: () {

        setState(() {
          _selectedState = !_selectedState;
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
        padding: EdgeInsets.all(12.0),
        foregroundColor: AppColors.primaryColor,
        side: BorderSide(color: AppColors.primaryColor),
      );
    }
    else {
      return OutlinedButton.styleFrom(
        padding: EdgeInsets.all(12.0),

      );
    }

  }
}
