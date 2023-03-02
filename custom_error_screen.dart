import 'package:flutter/material.dart';
import 'package:futara/controller/constants/app_images.dart';
import 'package:futara/controller/constants/size.dart';
import 'package:futara/view/widgets/my_text.dart';

/// TODO : just call it on main func
customErrorScreen() {
  return ErrorWidget.builder = ((details) {
    return Material(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: [
         /// TODO : add your image
            Image.asset(AppImages.logo, width: 200, height: 200),
            20.h,
            Padding(
              padding: const EdgeInsets.all(8),
              child: MyText(
                title: details.exception.toString(),
                color: Colors.white,
                alien: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
