import 'package:aims_college/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  String splashImg = 'assets/images/logo.jpg';
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    validate();
  }

  validate() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.HOME);
  }
}
