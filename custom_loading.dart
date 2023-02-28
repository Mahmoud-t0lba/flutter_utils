import 'package:flutter/material.dart';
import 'package:futara/controller/constants/app_images.dart';
import 'package:futara/controller/constants/change_lang.dart';
import 'package:futara/controller/resources/theme/colors_manager.dart';
import 'package:im_animations/im_animations.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}

class AnimatedLoading extends StatelessWidget {
  final String? img;
  const AnimatedLoading({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeartBeat(
        child: Image.asset(
          img ?? (langPathKey == 'ar' ? AppImages.logo : AppImages.logoEn),
          scale: 1,
        ),
      ),
    );
  }
}

class OverlayLoading extends StatelessWidget {
  final double? height;

  const OverlayLoading({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 400,
      child: const AppLoading(),
    );
  }
}
