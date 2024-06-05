import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> customDialogAnimation({
  String? title,
  String? content,
  String? animation,
  double? size,
}) async {
  Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.blueGrey[50],
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size ?? 150,
                width: size ?? 150,
                child: Lottie.asset(animation ?? Animations.successfulAnimaiton,
                    repeat: false),
              ),
              (title != null)
                  ? Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 10,
              ),
              (content != null)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          content,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ));
  await Future.delayed(const Duration(seconds: 3));
  Get.back();
}
