import 'package:flutter/material.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';
import 'package:futara/view/widgets/my_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
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
    this.radius,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final Color? color, borderColor, contentColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final TextDirection? textDirection;
  final Function? onTap;

  final String? text;
  final double? width, height, iconSize, radius, fontSize;
  final FontWeight? fontWeight;

  final bool? loading;
  final bool? hideIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? TextDirection.rtl,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: color ?? AppColors.blueColor,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: 2,
              ),
            ),
          ),
          onPressed:
              loading! /*.value*/ || onTap == null ? null : () => onTap!.call(),
          child: loading! /*.value*/
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : child ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: text!,
                        color: contentColor ?? Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
