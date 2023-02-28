import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.title,
    this.sub,
    this.onTap,
    this.textAlign,
    this.ansFontSize,
    this.quesFontSize,
    this.subStyle,
    this.titleStyle,
    this.isUnderLine = false,
  });

  final String? title, sub;
  final Function? onTap;
  final double? ansFontSize, quesFontSize;
  final TextStyle? titleStyle, subStyle;
  final TextAlign? textAlign;
  final bool? isUnderLine;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontSize: quesFontSize ?? 15,
          overflow: TextOverflow.ellipsis,
        ),
        children: [
          TextSpan(
            text: sub,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onTap != null) onTap!.call();
              },
            style: subStyle ??
                TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: ansFontSize ?? 15,
                  decoration: isUnderLine ?? false
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  color: AppColors.blueColor,
                ),
          ),
        ],
      ),
    );
  }
}
