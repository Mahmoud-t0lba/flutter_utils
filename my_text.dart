import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextStyle? style;

  const MyText({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
    this.style,
    this.alien,
    this.fontFamily,
    this.decoration,
    this.letterSpace,
    this.wordSpace,
    this.overflow,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr(),
      textAlign: alien ?? TextAlign.start,
      overflow: overflow,
      style: style ??
          TextStyle(
            color: color ?? AppColors.primaryColor,
            fontSize: fontSize ?? 16,
            decoration: decoration ?? TextDecoration.none,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
    );
  }
}
