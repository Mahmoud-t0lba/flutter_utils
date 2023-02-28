import 'package:flutter/material.dart';
import 'package:futara/controller/constants/app_images.dart';
import 'package:futara/controller/constants/change_lang.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.hideNotification,
    this.backgroundColor,
    this.elevation,
    this.actions,
    this.height,
    this.isLeading = true,
    this.bottom,
  });
  final Widget? leading, title;
  final bool? hideNotification, isLeading;
  final Color? backgroundColor;
  final double? elevation, height;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      automaticallyImplyLeading: isLeading ?? false,
      elevation: elevation ?? 0,
      centerTitle: true,
      title: title ??
          Image.asset(
            langPathKey == 'ar' ? AppImages.logo : AppImages.logoEn,
            width: 130,
            height: 130,
          ),
      actions: actions,
      leading: leading,
      bottom: bottom,
    );
  }

  @override
  Widget get child => const CustomAppBar();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70);
}
