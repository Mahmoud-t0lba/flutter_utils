import 'package:flutter/material.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';
import 'package:futara/view/widgets/my_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text,
    this.borderRadius,
    this.color,
    this.onTap,
    this.contentColor,
    this.width,
    this.height,
    this.borderColor,
    this.loading,
    this.hideIcon = false,
    this.padding,
    this.textDirection,
    this.child,
    this.iconSize,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.margin,
  });

  final Color? color, borderColor, contentColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding, margin;
  final TextDirection? textDirection;
  final Function? onTap;
  final String? text, fontFamily;
  final double? width, height, iconSize, fontSize;
  final FontWeight? fontWeight;
  final bool? loading, hideIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: color ?? AppColors.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            side:
                BorderSide(color: borderColor ?? Colors.transparent, width: 2),
          ),
        ),
        onPressed: () => onTap!(),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  title: text!,
                  color: contentColor ?? Colors.white,
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                  fontWeight: fontWeight,
                ),
              ],
            ),
      ),
    );
  }
}
