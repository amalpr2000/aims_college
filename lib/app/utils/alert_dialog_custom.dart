import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> customAlert(
    {required String title,
    required String content,
    String? animation,
    Color? buttonColor,
    Widget? widget,
    Function()? onPress,
    bool? cancelButton}) {
  RxBool buttonPressed = false.obs;
  String animations = animation ?? Animations.errorAnimaiton;
  Color? btColor = buttonColor ?? Colors.green[400];
  // if (Get.isDialogOpen ?? false) {
  //   Get.back();
  // }
  return Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.blueGrey[50],
        child: PopScope(
          canPop: false,
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
                  height: 70,
                  width: 70,
                  child: Lottie.asset(animations, repeat: false),
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      content,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                widget ?? const SizedBox.shrink(),
                (widget == null)
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 15,
                      ),
                cancelButton ?? false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 40,
                              width: Get.width * .3,
                              constraints: const BoxConstraints(
                                  maxWidth: 200, maxHeight: 50),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          InkWell(
                            onTap: () async {
                              if (buttonPressed.value == false) {
                                buttonPressed.value = true;
                                onPress == null ? Get.back() : await onPress();
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                buttonPressed.value = false;
                              }
                            },
                            child: Obx(
                              () => Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 200, maxHeight: 50),
                                height: 40,
                                width: Get.width * .3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: btColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: buttonPressed.value
                                    ? Lottie.asset(
                                        Animations.dotAnimaiton,
                                      )
                                    : const Text(
                                        "Continue",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {
                            onPress == null ? Get.back() : onPress();
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 200, maxHeight: 50),
                            height: 40,
                            width: Get.width * .3,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: btColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ));
}
