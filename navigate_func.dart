import 'package:flutter/material.dart';

Future<Object?> pushReplacementNamed(context,
        {required String route, Object? args}) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      arguments: args,
      (Route<dynamic> route) => false,
    );

Future<Object?> pushNamed(context, {required String route, Object? args}) =>
    Navigator.of(context).pushNamed(route, arguments: args);

void pop(BuildContext context) => Navigator.pop(context);
