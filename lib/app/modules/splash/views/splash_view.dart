import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Center(
                child: SizedBox(
                  height: Get.width * .9,
                  width: Get.width * .9,
                  child: Image.asset(controller.splashImg),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: LottieBuilder.asset(Animations.splashLoadingAnimation),
                ).marginOnly(top: Get.height * .25),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
