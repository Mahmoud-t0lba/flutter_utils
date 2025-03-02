import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'decorations.dart';
import 'extension_util/int_extensions.dart';

/// Make any variable nullable
T? makeNullable<T>(T? value) => value;

/// Enum for page route
enum PageRouteAnimation { fade, scale, rotate, slide, slideBottomTop }

/// has match return bool for pattern matching
bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

/// Show SnackBar
void snackBar(
  BuildContext context, {
  String title = '',
  Widget? content,
  SnackBarAction? snackBarAction,
  Function? onVisible,
  Color? textColor,
  Color? backgroundColor,
  EdgeInsets? margin,
  EdgeInsets? padding,
  Animation<double>? animation,
  double? width,
  ShapeBorder? shape,
  Duration? duration,
  SnackBarBehavior? behavior,
  double? elevation,
}) {
  if (title.isEmpty && content == null) {
    print('SnackBar message is empty');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        action: snackBarAction,
        margin: margin,
        animation: animation,
        width: width,
        shape: shape,
        duration: duration ?? 4.seconds,
        behavior: margin != null ? SnackBarBehavior.floating : behavior,
        elevation: elevation,
        onVisible: onVisible?.call(),
        content: content ??
            Padding(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                title,
                style: TextStyle(color: textColor ?? Colors.white),
              ),
            ),
      ),
    );
  }
}

/// Hide soft keyboard
void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

/// Returns a string from Clipboard
Future<String> paste() async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  return data?.text?.toString() ?? '';
}

/// Returns a string from Clipboard
Future<dynamic> pasteObject() async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  return data;
}

const double degrees2Radians = pi / 180.0;

double radians(double degrees) => degrees * degrees2Radians;

void afterBuildCreated(Function()? onCreated) {
  makeNullable(SchedulerBinding.instance)!.addPostFrameCallback((_) => onCreated?.call());
}

/// mailto: function to open native email app
Uri mailTo({required List<String> to, String subject = '', String body = '', List<String>? cc, List<String>? bcc}) {
  String subject0 = '';
  if (subject.isNotEmpty) subject0 = '&subject=$subject';

  String body0 = '';
  if (body.isNotEmpty) body0 = '&body=$body';

  String cc0 = '';
  if (cc?.isNotEmpty ?? true) cc0 = '&cc=${cc?.join(',')}';

  String bcc0 = '';
  if (bcc?.isNotEmpty ?? true) bcc0 = '&bcc=${bcc?.join(',')}';

  return Uri(
    scheme: 'mailto',
    query: 'to=${to.join(',')}$subject0$body0$cc0$bcc0',
  );
}

Widget dotIndicator(list, i, {bool isPersonal = false}) {
  return SizedBox(
    height: 16,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (ind) {
          return Container(
            height: 4,
            width: i == ind ? 30 : 12,
            margin: const EdgeInsets.all(4),
            decoration:
                BoxDecoration(color: i == ind ? Colors.blue : Colors.grey.withOpacity(0.5), borderRadius: radius(4)),
          );
        },
      ),
    ),
  );
}

Widget lineIndicator(list, i, {bool isPersonal = false}) {
  return SizedBox(
    height: 16,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        //  list.length,
        (ind) {
          return Container(
            height: 4,
            width: 50,
            // width: i == ind ? 30 : 12,
            margin: const EdgeInsets.all(4),
            decoration:
                BoxDecoration(color: i == ind ? Colors.blue : Colors.grey.withOpacity(0.5), borderRadius: radius(4)),
          );
        },
      ),
    ),
  );
}
