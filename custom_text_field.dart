import 'package:flutter/material.dart';
import 'package:futara/controller/constants/size.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';
import 'package:futara/view/widgets/my_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.textColor,
    this.fillColor,
    this.keyboardType,
    this.inputType = InputType.text,
    this.textDirection,
    this.textInputAction,
    this.onTap,
    this.show,
    this.enabled,
    this.text,
    this.maxLength,
    this.contentPadding,
    this.customPadding,
    this.validator,
    this.prefix,
  }) : super(key: key);
  final TextEditingController? controller;
  final EdgeInsets? contentPadding, customPadding;
  final String? hintText, text, validator;
  final TextInputType? keyboardType;
  final int? maxLength, maxLines;
  final bool? enabled, show;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;

  final InputType? inputType;
  final Color? textColor, fillColor;
  final GestureTapCallback? onTap;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customPadding ?? const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null) ...[
            MyText(
              title: text ?? '',
              color: textColor ?? AppColors.textColor,
            ),
            6.h,
          ],
          InkWell(
            onTap: onTap,
            child: TextFormField(
              style: const TextStyle(color: AppColors.primaryColor),
              controller: controller,
              cursorColor: AppColors.primaryColor,
              keyboardType: keyboardType,
              obscureText: (show ?? false /*.obs*/) /*.value*/,
              maxLength: maxLength,
              maxLines: maxLines ?? 1,
              textAlign: TextAlign.start,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return validator;
                }
                return null;
              },
              textDirection: textDirection,
              textInputAction: textInputAction ?? TextInputAction.next,
              decoration: InputDecoration(
                border: inputBorder,
                enabledBorder: inputBorder,
                suffixIcon: IconButton(
                  color: AppColors.primaryColor,
                  onPressed: () => show!,
                  icon: Icon(
                    show! /*.value*/ ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                prefix: prefix,
                // enabled: onTap == null ? (enabled ?? true.obs).value : false,
                focusedBorder: inputBorder,
                hintText: hintText,
                fillColor: fillColor ?? AppColors.textColor,
                filled: fillColor != null ? true : false,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 10),
                counterText: '',
              ),
            ),
            // child: Obx(
            //   () => TextFormField(
            //     style: const TextStyle(color: AppColors.primaryColor),
            //     controller: controller,
            //     cursorColor: AppColors.primaryColor,
            //     keyboardType: keyboardType,
            //     obscureText: (show ?? false/*.obs*/).value,
            //     maxLength: maxLength,
            //     maxLines: maxLines ?? 1,
            //     textAlign: TextAlign.start,
            //     validator: (String? value) {
            //       if (value == null || value.isEmpty) {
            //         return validator;
            //       }
            //       return null;
            //     },
            //     textDirection: textDirection,
            //     textInputAction: textInputAction ?? TextInputAction.next,
            //     decoration: InputDecoration(
            //       border: inputBorder,
            //       enabledBorder: inputBorder,
            //       suffixIcon: inputType == InputType.password
            //           ? Obx(
            //               () => IconButton(
            //                 color: Get.theme.primaryColor,
            //                 onPressed: () => show!(!show!.value),
            //                 icon: Icon(
            //                   show!.value
            //                       ? Icons.visibility
            //                       : Icons.visibility_off,
            //                   color: Colors.grey,
            //                 ),
            //               ),
            //             )
            //           : null,
            //       prefix: prefix,
            //       enabled: onTap == null ? (enabled ?? true.obs).value : false,
            //       focusedBorder: inputBorder,
            //       hintText: hintText,
            //       fillColor: fillColor ?? AppColors.textColor,
            //       filled: fillColor != null ? true : false,
            //       contentPadding: contentPadding ??
            //           const EdgeInsets.symmetric(horizontal: 10),
            //       counterText: '',
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  InputBorder get inputBorder => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.grey, width: .5));
}

enum InputType { password, text }
