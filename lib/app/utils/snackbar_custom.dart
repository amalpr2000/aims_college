import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

SnackbarController customSnackbar(
    {required String msg, double? length, var position, var animationImg}) {
  SnackPosition pos = position ?? SnackPosition.BOTTOM;
  String animationImage = animationImg ?? Animations.alertAnimaiton;
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  return Get.snackbar('title', 'msg',
      titleText: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          SizedBox(height: 30, width: 30, child: Lottie.asset(animationImage)),
          const SizedBox(
            width: 5,
          ),
          Text(msg)
        ],
      ),
      messageText: const SizedBox.shrink(),
      snackPosition: pos,
      margin: const EdgeInsets.only(bottom: 100),
      maxWidth: length ?? 150,
      backgroundColor: Colors.blueGrey[50],
      duration: const Duration(seconds: 2),
      colorText: Colors.white,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
      padding: const EdgeInsets.only(top: 5));
}
