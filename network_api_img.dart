import 'package:flutter/material.dart';
import 'package:futara/controller/constants/strings.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? width, height;

  const AppNetworkImage(
      {super.key, required this.url, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${AppStrings.baseUrl}/$url',
      fit: BoxFit.cover,
      height: height ?? 100,
      width: width ?? 100,
    );
  }
}
