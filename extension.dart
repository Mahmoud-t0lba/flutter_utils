import 'package:flutter/material.dart';
import 'router.dart';

extension SizeExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension Height on Widget {
  double get sHeight => MediaQuery.of(MagicRouter.currentContext!).size.height;
}

extension Width on Widget {
  double get sWidth => MediaQuery.of(MagicRouter.currentContext!).size.width;
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
