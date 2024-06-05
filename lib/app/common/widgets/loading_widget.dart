import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.animation,
    this.size,
  });
  final double? size;
  final String? animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: size ?? 40,
          width: size ?? 40,
          child: Lottie.asset(animation ?? Animations.blueLoadingAnimaiton)),
    );
  }
}
