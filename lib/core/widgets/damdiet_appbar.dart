import 'package:flutter/material.dart';
import '../../../core/theme/appcolor.dart';

class DamdietAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final bool showBackButton;
  final VoidCallback? onBack;
  final Widget? action;

  const DamdietAppbar({
    super.key,
    required this.title,
    this.isHome = false,
    this.showBackButton = true,
    this.onBack,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: isHome
          ? Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Image.asset(
          'assets/images/damdiet_logo_9.png',
          width: 36,
          height: 36,
        ),
      )
          : (showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: AppColors.textMain, size: 20),
        onPressed: onBack ?? () => Navigator.of(context).pop(),
      )
          : null),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textMain,
          fontSize: 18,
          fontFamily: 'PretendardBold',
        ),
      ),
      centerTitle: true,
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
