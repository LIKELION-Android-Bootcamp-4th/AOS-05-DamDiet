import 'package:flutter/cupertino.dart';

import '../../../util/appcolor.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      color: AppColors.primaryColorLight,
      child: Center(child: Text("배너")),
    );
  }
}
