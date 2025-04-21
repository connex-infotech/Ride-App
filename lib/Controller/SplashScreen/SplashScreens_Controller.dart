import 'package:get/get.dart';

import '../../UI_Screen/Onboarding/01_Onboarding.dart';

class SplashScreensController extends GetxController{
  RxBool isSplashComplete = false.obs;

  void navigateOnboarding01() {
    Future.delayed(Duration(seconds: 3), () {
      isSplashComplete.value = true;
      Get.off(() => Onboarding01()); // Use Get.to() to navigate to the screen
    });
  }}