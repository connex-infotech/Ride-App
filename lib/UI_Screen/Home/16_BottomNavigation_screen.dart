import 'package:easyrider15/Controller/Home/16_Bottom_Navigation_Controller.dart';
import 'package:easyrider15/component/colors_helper.dart';
import 'package:easyrider15/component/light_dark_mode_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '16_home_screen_Transport.dart';

class BottomNavigationHomeScreen extends StatelessWidget {
  BottomNavigationHomeScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      // RoomMateScreen(), //Screen2
      // MenuScreen(), // Screen 3
      // EditProfile(), // Screen 4
    ];

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Obx(() {
              return _widgetOptions[controller.selectedIndex.value];
            }),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // Reduced opacity for smoother shadow
                  blurRadius: 10, // Increase blur for a softer shadow
                  offset: Offset(0, -4), // Shadow offset to create a floating effect
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),  // Adjust this value for sharper or more rounded corners
                topRight: Radius.circular(30.0), // Adjust this value for sharper or more rounded corners
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),  // Ensure the `ClipRRect` clips the container with the same radius
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                unselectedFontSize: 12,
                selectedFontSize: 12,
                elevation: 10,
                unselectedItemColor:  Theme.of(context).brightness == Brightness.dark
                  ? AppColor.greyColor
                  : AppColor.blackColor1,
                selectedItemColor: AppColor.pinkColor,
                currentIndex: controller.selectedIndex.value,
                onTap: controller.onItemTapped,
                items: [
                  bottomNavigationBarItem(
                    label: "Home",
                    assetImage: "assets/icons/house (1).svg",
                    selectedIndex: controller.selectedIndex.value == 0,
                  ),
                  bottomNavigationBarItem(
                    label: "Favourite",
                    assetImage: "assets/icons/16_BottomNavigation_screen_heart.svg",
                    selectedIndex: controller.selectedIndex.value == 1,
                  ),
                  bottomNavigationBarItem(
                    label: "Wallet",
                    selectedIndex: controller.selectedIndex.value == 2,
                      assetImage: "assets/images/hexa_modified_1.svg",
                  ),
                  bottomNavigationBarItem(
                    label: "Offer",
                    assetImage: "assets/icons/16_BottomNavigation_screen_icon_discount.svg",
                    selectedIndex: controller.selectedIndex.value == 3,
                  ),
                  bottomNavigationBarItem(
                    label: "Profile",
                    assetImage: "assets/icons/16_BottomNavigation_screen_icon_user.svg",
                    selectedIndex: controller.selectedIndex.value == 4,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({String? assetImage, bool? selectedIndex, String? label ,}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetImage ?? "",
        width: 24,
        height: 24,
        color: selectedIndex == true ? AppColor.pinkColor : LightDarkModeHelper.blackColorGreyColor,
      ),
      label: label,

    //   labelStyle: TextStyle(
    //     fontSize: 12, // Set your preferred font size
    //
    //     color: selectedIndex == true ? AppColor.pinkColor : LightDarkModeHelper.blackColorGreyColor, // Color changes based on selected state
    //   ),
    );
  }
}
