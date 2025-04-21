
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/Onboarding/01_Onboarding_Controller.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../Authentication/04_Enable_location.dart';


class Onboarding01 extends StatelessWidget {
  final Onboarding01Controller onboarding01controller = Get.put(Onboarding01Controller());

  Onboarding01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView( // PageView widget for swiping
              controller: onboarding01controller.pageController,
              children: [
                buildOnboarding01Page(context),
                buildOnboarding02Page(context),
                buildOnboarding03Page(context),



                // Add more pages as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
  
//////////////////////////////////////////////////////////////////////
  
  Widget buildOnboarding01Page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                onboarding01controller.toggleTheme();
              },
              child: Text(
                StringHelper.skip, // Replace with your skip text
              ),
            ),
          ),
          SizedBox(height: 60),
          SvgPicture.asset("assets/images/01_OnboardingScreen_Anywhereyouare.svg"),
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                StringHelper.anyWhereYouAre, // Replace with your dynamic text
                style: StyleHelper(context).anyWhereYouAre(context),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringHelper.sellHousesEasilyWithTheHelp, // Replace with your dynamic text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.greyColor // Lighter grey for dark mode
                          : AppColor.greyColor1, // Darker grey for light mode
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
         Spacer(),
          GestureDetector(
            onTap: () {
             onboarding01controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            child: Image.asset("assets/icons/01_OnboardingScreen_Group296.png", height: 86),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
  
///////////////////////////////////////////////////////////////////////////
  
  Widget buildOnboarding02Page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // onboarding01controller.toggleTheme();
              },
              child: Text(
                StringHelper.skip, // Replace with your skip text
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.whiteColor
                      : AppColor.blackColor, // Automatically change text color
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          SvgPicture.asset("assets/images/02_OnboardingScreen_Atanytime.svg"),
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                StringHelper.atAnytime, // Replace with your dynamic text
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.whiteColor1
                      : AppColor.blackColor1, // Automatically change text color
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringHelper.sellHousesEasilyWithThe, // Replace with your dynamic text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.greyColor // Lighter grey for dark mode
                          : AppColor.greyColor1, // Darker grey for light mode
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
         Spacer(),
          GestureDetector(
            onTap: () {
              onboarding01controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);},
            child: Image.asset("assets/icons/02_OnboardingScreen_Group297.png", height: 86),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

 //////////////////////////////////////////////////////////////////

  Widget buildOnboarding03Page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // onboarding01controller.toggleTheme();
              },
              child: Text(
                StringHelper.skip, // Replace with your skip text
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.whiteColor
                      : AppColor.blackColor, // Automatically change text color
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          SvgPicture.asset("assets/images/03_OnboardingScreen_Frame1.svg"),
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                StringHelper.atAnytime, // Replace with your dynamic text
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.whiteColor1
                      : AppColor.blackColor1, // Automatically change text color
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringHelper.sellHousesEasilyWithThe, // Replace with your dynamic text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.greyColor // Lighter grey for dark mode
                          : AppColor.greyColor1, // Darker grey for light mode
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context)=>EnableLocation()));},
            child: Image.asset("assets/icons/03_OnboardingScreen_Group11.png", height: 86),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

}

















// import 'package:easyrider/Controller/Onboarding/01_Onboarding_Controller.dart';
// import 'package:easyrider/component/colors_helper.dart';
// import 'package:easyrider/component/string_helper.dart';
// import 'package:easyrider/component/style_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class Onboarding01 extends StatelessWidget {
//   Onboarding01({super.key});
//   Onboarding01Controller onboarding01controller = Get.put(Onboarding01Controller());
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: SizedBox(
//                      height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                        children:[
//                          SizedBox(height: 15,),
//                          Align(
//                            alignment: Alignment.centerRight,
//                            child: GestureDetector(
//                              onTap: () {  },
//                              child: Obx(() {
//                                // Use GetX to observe the theme and change text color accordingly
//                                return Text(
//                                  StringHelper.skip,
//                                  style: TextStyle(
//                                    color: onboarding01controller.isDarkMode.value
//                                        ? AppColor.whiteColor
//                                        : AppColor.blackColor,
//                                    fontSize: 16,
//                                    fontWeight: FontWeight.w400,
//                                  ),
//                                );
//                              }),
//                            ),
//                          ),
//                    SizedBox(height: 60,),
//                    SvgPicture.asset("assets/images/01_OnboardingScreen_Anywhereyouare.svg"),
//                          SizedBox(height: 20),
//                          Obx(() {
//                            return Column(
//                              children: [
//                                Text(
//                                  StringHelper.anyWhereYouAre,
//                                  style: TextStyle(
//                                    color: onboarding01controller.isDarkMode.value
//                                        ? AppColor.whiteColor1
//                                        : AppColor.blackColor1,
//                                    fontSize: 24,
//                                    fontWeight: FontWeight.w500,
//                                  ),
//                                ),
//                                SizedBox(height: 10,),
//                                Padding(
//                                  padding: const EdgeInsets.symmetric(horizontal: 60.0),  // Adjust padding to your needs
//                                  child: Align(
//                                    alignment: Alignment.center,  // Centering the text within the padding
//                                    child: Text(
//                                      StringHelper.sellHousesEasilyWithTheHelp,
//                                      textAlign: TextAlign.center,  // Center text within its container
//                                      style: TextStyle(
//                                        color: onboarding01controller.isDarkMode.value
//                                            ? AppColor.greyColor
//                                            : AppColor.greyColor1,
//                                        fontSize: 14,
//                                        fontWeight: FontWeight.w500,
//                                      ),
//                                    ),
//                                  ),
//                                )
//
//                              ],
//                            );
//                          }),
//                          SizedBox(height: 170,),
//                          GestureDetector(
//                            onTap: (){},
//                              child: Image.asset("assets/icons/01_OnboardingScreen_Group296.png",height: 86,))
//                             ]),
//               )),
//           ),
//     ));
//   }
//}
