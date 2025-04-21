import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding01Controller extends GetxController {
  RxBool isDarkMode = false.obs;
  final PageController pageController = PageController();

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
