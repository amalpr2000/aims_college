import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.message,
    this.size,
    this.animation,
  });
  final String message;
  final double? size;
  final String? animation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: Get.height * .75,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: size ?? 100,
                  width: size ?? 100,
                  child: Lottie.asset(animation ?? Animations.noDataAnimaiton,
                      repeat: false)),
              Text(message)
            ],
          ),
        ),
      ),
    );
  }
}
