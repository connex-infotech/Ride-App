import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Controller/Authentication/12_Forget_Password_Controller.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '13_phone_verify_otp.dart'; // Import the phone verify OTP screen

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final ForGotPasswordController forGotPasswordController =
  Get.put(ForGotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColor.whiteColor2
                            : AppColor.blackColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      StringHelper.back,
                      style: StyleHelper(context).backTextStyle(context),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  StringHelper.forgotPassword,
                  style: StyleHelper(context)
                      .verificationEmailOrPhoneNumberTextStyle(context),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Select which contact details should we use to reset your password",
                    textAlign: TextAlign.center,
                    style: StyleHelper(context).enterYourOTPCode(context),
                  ),
                ),
                SizedBox(height: 40),
                Obx(() {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: forGotPasswordController.combinedItems.length,
                      itemBuilder: (context, index) {
                        var item = forGotPasswordController.combinedItems[index];

                        bool isSelected = forGotPasswordController.selectedItem.value.isNotEmpty &&
                            forGotPasswordController.selectedItem.value['name'] == item['name'];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: GestureDetector(
                            onTap: () {
                              // Toggle selection of the item
                              forGotPasswordController.selectedItem.value = isSelected ? {} : item;
                              forGotPasswordController.selectedItem.update((val) {});
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: isSelected ? Colors.pinkAccent : AppColor.pinkColor4,
                                ),
                                color: isSelected ? AppColor.whiteColor3 : Colors.transparent,
                              ),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.pinkColor,
                                    ),
                                  ),
                                  child: SvgPicture.asset(item['icon']!),
                                ),
                                title: Text(
                                  item['name']!,
                                  style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColor.greyColor
                                        : AppColor.greyColor2,
                                  ),
                                ),
                                subtitle: Text(
                                  item['message']!,
                                  style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColor.greyColor2
                                        : AppColor.blackColor3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Spacer(),
                ElevatedButtonHelperClass.customElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    if (forGotPasswordController.selectedItem.value.isNotEmpty) {
                      // Navigate to PhoneVerifyOTP screen and pass the selected item data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneVerifyOTP(
                            selectedItem: forGotPasswordController.selectedItem.value, // Pass the data here
                          ),
                        ),
                      );
                    } else {
                      // Show an alert if no item is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select a contact method."),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../Controller/Authentication/12_Forget_Password_Controller.dart';
// import '../../Uihelper/elevatedButton_HelperClass.dart';
// import '../../component/colors_helper.dart';
// import '../../component/string_helper.dart';
// import '../../component/style_helper.dart';
//
// class ForgetPassword extends StatelessWidget {
//   ForgetPassword({super.key});
//
//   final ForGotPasswordController forGotPasswordController =
//       Get.put(ForGotPasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 15),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).pop(),
//                       child: Icon(
//                         Icons.arrow_back_ios_new_outlined,
//                         size: 20,
//                         color: Theme.of(context).brightness == Brightness.dark
//                             ? AppColor.whiteColor2
//                             : AppColor.blackColor,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       StringHelper.back,
//                       style: StyleHelper(context).backTextStyle(context),
//                     ),
//                   ],
//                 ),
//                 /////////////////////////////////////////////////
//                 SizedBox(height: 40),
//                 Text(
//                   StringHelper.forgotPassword,
//                   style: StyleHelper(context)
//                       .verificationEmailOrPhoneNumberTextStyle(context),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: Text(
//                     "Select which contact details should we use to reset your password",
//                     textAlign: TextAlign.center,
//                     style: StyleHelper(context).enterYourOTPCode(context),
//                   ),
//                 ),
//                 SizedBox(height: 40),
//
//                 Obx(() {
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: forGotPasswordController.combinedItems.length,
//                       itemBuilder: (context, index) {
//                         var item =
//                             forGotPasswordController.combinedItems[index];
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 12.0),
//                           child: Container(
//                             height: 80,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 border: Border.all(
//                                   color: Colors.pinkAccent,
//                                 )),
//                             child: ListTile(
//                               leading: Container(
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.pinkAccent,
//                                       )),
//                                   child: SvgPicture.asset(item['icon']!)),
//                               title: Text(item['name']!),
//                               subtitle: Text(item['message']!),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }),
//
//                 Spacer(),
//                 ElevatedButtonHelperClass.customElevatedButton(
//                     text: "Continue", onPressed: () {}),
//                 SizedBox(
//                   height: 10,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Added some space before the ListView

// Use Expanded here to allow ListView.builder to take remaining space
// Expanded(
//   child: ListView.builder(
//     itemCount:forGotPasswordController.items.length,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 15.0),
//         child: GestureDetector(
//           onTap: (){},
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
//             height: 80,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: Colors.pinkAccent,
//               ),
//             ),
//             child: Row(
//               children: [
//                Container(
//                  height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                  border: Border.all(
//                    color: Colors.pinkAccent,
//                  )
//                 ),
//                  child: SvgPicture.asset(forGotPasswordController.items[index]),
//                ),
//                 SizedBox(width: 10,),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(forGotPasswordController.items1[index]),
//                     Text(forGotPasswordController.items2[index])
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// ),
