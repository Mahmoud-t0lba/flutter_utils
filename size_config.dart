import 'package:flutter/material.dart';

/// TODO : just call => SizeConfig.init(context); => in build widget
class SizeConfig {
  static BuildContext? appContext;
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }

  static double getHeight(double height) {
    return _mediaQueryData!.size.height * (height / 814);
  }

  static double getWidth(double width) {
    return _mediaQueryData!.size.width * (width / 360);
  }

  static double getTextSize(double textSize) {
    return _mediaQueryData!.size.width * (textSize / 414);
  }
}
