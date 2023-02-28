import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:futara/view/widgets/my_text.dart';

displayDialog(context) async {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        insetAnimationDuration: const Duration(seconds: 10),
        insetAnimationCurve: Curves.easeInCubic,
        title: const MyText(title: 'close_app_title', fontSize: 22),
        content: const MyText(title: 'close_app_body', fontSize: 18),
        actions: [
          CupertinoButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const MyText(title: 'cancel'),
          ),
          CupertinoButton(
            onPressed: () => exit(0),
            child: const MyText(title: 'exit'),
          ),
        ],
      );
    },
  );
}
