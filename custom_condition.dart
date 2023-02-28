import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:futara/view/widgets/custom_loading.dart';

class CustomCondition extends StatelessWidget {
  final bool state;
  final Widget body;
  final Widget? loading;

  const CustomCondition({
    super.key,
    required this.state,
    required this.body,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) => state,
      widgetBuilder: (context) => body,
      fallbackBuilder: (context) => loading ?? const AppLoading(),
    );
  }
}
