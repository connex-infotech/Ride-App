import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/SplashScreen/SplashScreens_Controller.dart';
import '../../component/colors_helper.dart';
class SplashScreens extends StatelessWidget {
   SplashScreens({super.key});
  final SplashScreensController spLashController = Get.put(SplashScreensController());

   @override
  Widget build(BuildContext context) {
     spLashController.navigateOnboarding01();
    return Scaffold(
      backgroundColor:AppColor.pinkColor,
      body: SafeArea(
            child: SizedBox(
       height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: SvgPicture.asset("assets/icons/SplashScreen_Logo.svg"),
              ),
            )),
    );
  }
}
