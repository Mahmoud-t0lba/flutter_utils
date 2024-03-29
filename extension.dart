import 'package:flutter/material.dart';
import 'router.dart';
import 'size_config.dart';

extension SizeExtension on num {
  SizedBox get hBox => SizedBox(height: toDouble());
  SizedBox get wBox => SizedBox(width: toDouble());
  ///
  double get h => SizeConfig.getHeight(toDouble());
  double get w => SizeConfig.getWidth(toDouble());
  double get sp => SizeConfig.getTextSize(toDouble());
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension StringExtension on String {
  String get capitalize => isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
}

extension HexString on String {
  int toHex() => int.parse(replaceAll('#', '0xff'));
}

extension DurationExtensions on Duration {
  String toHoursMinutes() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes";
  }

  String toHoursMinutesSeconds() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
