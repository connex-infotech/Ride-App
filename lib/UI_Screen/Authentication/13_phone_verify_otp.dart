import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Authentication/13_phone_verify_otp_Controller.dart';
import '../../Uihelper/InkWellButton_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '09_set_password.dart';
import '15_set_new_password.dart';

class PhoneVerifyOTP extends StatelessWidget {
  final Map<String, String> selectedItem; // Declare a field for the passed data
  final PhoneVerifyOTPController phoneVerifyOTPController =
  Get.put(PhoneVerifyOTPController());

  // Constructor to receive data
  PhoneVerifyOTP({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {Navigator.of(context).pop();},
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
                SizedBox(height: 30),
                Center(
                  child: Text(
                    StringHelper.forgotPassword,
                    style: StyleHelper(context).signUpTextStyle(context),
                  ),
                ),
                SizedBox(height: 30),
                // Display the passed data here (optional)
                Text("Code has been sent to: ${selectedItem['message']}"),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOTPField(
                          phoneVerifyOTPController.otpController1,
                          phoneVerifyOTPController.focusNode1,
                          phoneVerifyOTPController.focusNode2,
                          null),
                      buildOTPField(
                          phoneVerifyOTPController.otpController2,
                          phoneVerifyOTPController.focusNode2,
                          phoneVerifyOTPController.focusNode3,
                          phoneVerifyOTPController.focusNode1),
                      buildOTPField(
                          phoneVerifyOTPController.otpController3,
                          phoneVerifyOTPController.focusNode3,
                          phoneVerifyOTPController.focusNode4,
                          phoneVerifyOTPController.focusNode2),
                      buildOTPField(
                          phoneVerifyOTPController.otpController4,
                          phoneVerifyOTPController.focusNode4,
                          phoneVerifyOTPController.focusNode5,
                          phoneVerifyOTPController.focusNode3),
                      buildOTPField(
                          phoneVerifyOTPController.otpController5,
                          phoneVerifyOTPController.focusNode5,
                          null,
                          phoneVerifyOTPController.focusNode4),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButtonHelperClass.customElevatedButton(
                    text: StringHelper.verify,
                    onPressed: () {
                      if (kDebugMode) {
                        print('OTP verification process started');
                        // Navigate to the next screen after verification, e.g., SetPassword screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SetNewPassword()),
                        );
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOTPField(RxString otpField, Rx<FocusNode> currentFocus, Rx<FocusNode>? nextFocus, Rx<FocusNode>? prevFocus) {
    return SizedBox(
      width: 50,
      child: Obx(() {
        return TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          focusNode: currentFocus.value,
          decoration: InputDecoration(
            filled: true,
            fillColor: otpField.value.isEmpty ? AppColor.whiteColor1 : AppColor.pinkColor3,
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
            ),
          ),
          onChanged: (text) {
            otpField.value = text;
            if (text.isNotEmpty && nextFocus != null) {
              currentFocus.value.unfocus();
              FocusScope.of(Get.context!).requestFocus(nextFocus.value);
            } else if (text.isEmpty && prevFocus != null) {
              currentFocus.value.unfocus();
              FocusScope.of(Get.context!).requestFocus(prevFocus.value);
            }
          },
          controller: TextEditingController(text: otpField.value),
        );
      }),
    );
  }
}



















// import 'package:easyrider15/Controller/Authentication/13_phone_verify_otp_Controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Uihelper/InkWellButton_HelperClass.dart';
// import '../../Uihelper/elevatedButton_HelperClass.dart';
// import '../../component/colors_helper.dart';
// import '../../component/string_helper.dart';
// import '../../component/style_helper.dart';
// import '09_set_password.dart';
//
// class PhoneVerifyOTP extends StatelessWidget {
//    PhoneVerifyOTP({super.key});
// final PhoneVerifyOTPController phoneVerifyOTPController = Get.put(PhoneVerifyOTPController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child:Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 12.0),
//             child: SizedBox(
//              height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   ////////////////////////////////////////////
//
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.arrow_back_ios_new_outlined,
//                       size: 20,
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? AppColor.whiteColor2
//                           : AppColor.blackColor,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     StringHelper.back,
//                     style: StyleHelper(context).backTextStyle(context),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Center(
//                 child: Text(
//                   StringHelper.forgotPassword,
//                   style: StyleHelper(context).signUpTextStyle(context),
//                 ),
//               ),
//
//               SizedBox(height: 30),
//               // Center(
//               //   child: Text(
//               //     "Enter your OTP code",
//               //     style: StyleHelper(context).enterYourOTPCode(context),
//               //   ),
//               // ),
//               SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 35),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     buildOTPField(
//                         phoneVerifyOTPController.otpController1,
//                         phoneVerifyOTPController.focusNode1,
//                         phoneVerifyOTPController.focusNode2,
//                         null),
//                     buildOTPField(
//                         phoneVerifyOTPController.otpController2,
//                         phoneVerifyOTPController.focusNode2,
//                         phoneVerifyOTPController.focusNode3,
//                         phoneVerifyOTPController.focusNode1),
//                     buildOTPField(
//                         phoneVerifyOTPController.otpController3,
//                         phoneVerifyOTPController.focusNode3,
//                         phoneVerifyOTPController.focusNode4,
//                         phoneVerifyOTPController.focusNode2),
//                     buildOTPField(
//                         phoneVerifyOTPController.otpController4,
//                         phoneVerifyOTPController.focusNode4,
//                         phoneVerifyOTPController.focusNode5,
//                         phoneVerifyOTPController.focusNode3),
//                     // buildOTPField(verifyOTPController.otpController5, verifyOTPController.focusNode5, verifyOTPController.focusNode6, verifyOTPController.focusNode4),
//                     buildOTPField(
//                         phoneVerifyOTPController.otpController5,
//                         phoneVerifyOTPController.focusNode5,
//                         null,
//                         phoneVerifyOTPController.focusNode4,),
//                   ],
//                 ),
//               ),
//
//
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(StringHelper.diDntReceiveCode,
//                         style: StyleHelper(context)
//                             .alreadyHaveAnAccountTextStyle(context)),
//                     InkWellButtonHelperClass.customTextLink(
//                         text: StringHelper.resendAgain, onTap: () {})
//                   ],
//                 ),
//               ),
//               Spacer(),
//               // SizedBox(height: MediaQuery.of(context).size.height*.09),
//               ElevatedButtonHelperClass.customElevatedButton(
//                   text: StringHelper.verify,
//                   onPressed: () {
//                     if (kDebugMode) {
//                       print('ffffffff');
//                     // Navigator.pushReplacement(context,
//                     //     MaterialPageRoute(builder: (context) => SetPassword()));
//
//                     }}),
//
//               SizedBox(
//                 height: 20,
//               )
//
//               ////////////////////////////////////
//
//                 ],
//               ),
//             ),
//           )),
//     );}
//   Widget buildOTPField(RxString otpField, Rx<FocusNode> currentFocus, Rx<FocusNode>? nextFocus, Rx<FocusNode>? prevFocus) {
//     return SizedBox(
//       width: 50,
//       child: Obx(() {
//         return TextField(
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           maxLength: 1, // Limit to 1 character
//           focusNode: currentFocus.value,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor:otpField.value.isEmpty ? AppColor.whiteColor1:AppColor.pinkColor3,
//             counterText: '',
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2, // Change border color based on text
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2),
//             ),
//           ),
//           onChanged: (text) {
//             otpField.value = text;
//
//             // Automatically move to next/previous focus if field is filled/empty
//             if (text.isNotEmpty && nextFocus != null) {
//               currentFocus.value.unfocus();
//               FocusScope.of(Get.context!).requestFocus(nextFocus.value);
//             } else if (text.isEmpty && prevFocus != null) {
//               currentFocus.value.unfocus();
//               FocusScope.of(Get.context!).requestFocus(prevFocus.value);
//             }
//           },
//           controller: TextEditingController(text: otpField.value),
//         );
//       }),
//     );
//   }
//
// }
//
