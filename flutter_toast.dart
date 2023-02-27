import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastStates { success, error, warning }

class MessageUtils {
  static Color chooseToastColor(ToastStates state) {
    Color color;
    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.amber;
        break;
    }

    return color;
  }

  static void showToastApp(
          {required String msg,
          Duration? duration,
          required ToastStates state}) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16,
      );

  static void hintSnackBar(BuildContext context,
      {required String msg, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: duration ?? const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  static void loadingSnackBar(BuildContext context,
      {required String msg, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.tealAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: duration ?? const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  static void successSnackBar(BuildContext context,
      {required String msg, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: duration ?? const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  static void errorSnackBar(BuildContext context,
      {required String msg, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: duration ?? const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}
