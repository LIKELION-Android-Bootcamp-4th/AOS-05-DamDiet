import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/provider/search_provider.dart';
import '../theme/appcolor.dart';


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


class CategoryWithDeleteOutlineButton extends StatefulWidget {
  const CategoryWithDeleteOutlineButton({super.key, required this.text});

  final String text;

  @override
  State<CategoryWithDeleteOutlineButton> createState() => _CategoryWithDeleteOutlineButtonState();
}

class _CategoryWithDeleteOutlineButtonState extends State<CategoryWithDeleteOutlineButton> {
  bool _btnVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _btnVisibility,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(14.0),
            foregroundColor: AppColors.textHint,
            side: BorderSide(color: AppColors.textHint),
            textStyle: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium')
        ),
        onPressed: () {
          setState(() {
            _btnVisibility = !_btnVisibility;
          });
        },
        child: Row(
          children: [
            Text(widget.text,
                style: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium')
            ),
            SizedBox(width: 6),
            Icon(Icons.close)
          ],
        )

      )
    );

  }
}

