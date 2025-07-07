import 'package:flutter/cupertino.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../core/widgets/underline_text.dart';

class NoticeBanner extends StatelessWidget {
  const NoticeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "공지",
              style: TextStyle(
                  fontFamily: 'PretendardBlack',
                  fontSize: 14,
                  color: AppColors.textMain
              ),
            ),
            SizedBox(width: 20,),
            UnderlineText(
              text: '담다잇 커뮤니티에 오신 것을 환영합니다',
              textStyle: TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 14,
                  color: AppColors.textMain
              ),
            )
          ]
      ),
    );
  }
}