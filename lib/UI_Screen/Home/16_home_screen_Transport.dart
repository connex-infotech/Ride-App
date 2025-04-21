import 'package:easyrider15/Controller/Home/16_home_screen_Transport_Controller.dart';
import 'package:easyrider15/Uihelper/textField_HelperClass.dart';
import 'package:easyrider15/component/colors_helper.dart';
import 'package:easyrider15/component/light_dark_mode_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easyrider15/Uihelper/elevatedButton_HelperClass.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/light_dark_mode_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/16_BottomNavigation_screen_icon_Map.svg",
                fit: BoxFit
                    .cover, // This ensures the image covers the full screen
              ),
              Positioned(
                left: 15,
                child: IconButton(
                  icon: Icon(Icons.line_axis),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 50,
                child: IconButton(
                  icon: Icon(Icons.plus_one),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 15,
                child: IconButton(
                  icon: Icon(Icons.plus_one),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 150,
                left: 50,
                right: 50,
                child: SvgPicture.asset(
                  "assets/images/16_BottomNavigation_screen_PlaceIndicate.svg",
                ),
              ),
              Positioned(
                bottom: 255,
                left: 12,
                right: 30,
                child: Padding(
                  padding: const EdgeInsets.only(right: 170.0),
                  child: ElevatedButtonHelperClass.customElevatedButton(
                    text: "Rental",
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 141,
                    width: MediaQuery.of(context).size.width - 24,
                    padding: EdgeInsets.symmetric(horizontal: 08, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.pinkColor // Assuming AppColor.pinkColor
                        ),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.blackColor6 // Lighter grey for dark mode
                          : AppColor.pinkColor3,),
                    child: Column(
                      children: [
                        TextFieldHelperClass.customTextField(
                          controller: homeScreenController.searchController,
                          hintText: "Where would you go?",
                          validator: (String? value) {},
                        ),
                        SizedBox(height: 12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color:
                                   AppColor.pinkColor
                              ),
                                color:Theme.of(context).brightness == Brightness.dark
                                    ? AppColor.blackColor6
                                    : AppColor.pinkColor4,

                            ),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        homeScreenController.selectContainer(0),
                                    child: Obx(() {
                                      return Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.44,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: homeScreenController
                                                      .selectedIndex.value == 0
                                              ? AppColor.pinkColor1
                                              : null
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Transport",
                                          style: TextStyle(
                                            color: homeScreenController
                                                        .selectedIndex.value ==
                                                    1
                                                ? null:AppColor.whiteColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                          ),
                                        )),
                                      );
                                    }),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        homeScreenController.selectContainer(1),
                                    child: Obx(() {
                                      return Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.44,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: homeScreenController
                                                      .selectedIndex.value ==
                                                  1
                                              ? AppColor.pinkColor1
                                              :  null
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Delivery",
                                          style: TextStyle(
                                              color: homeScreenController
                                                          .selectedIndex.value == 1
                                                  ? AppColor.whiteColor1
                                                  : null,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: "Poppins",),
                                        )),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
