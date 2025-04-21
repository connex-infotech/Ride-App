import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/07_verify_otp_Controller.dart';
import '../../Uihelper/InkWellButton_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '09_set_password.dart';
class VerifyOTP extends StatelessWidget {
   VerifyOTP({super.key});

  final VerifyOTPController verifyOTPController = Get.put(VerifyOTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // child: SingleChildScrollView(
                child: Form(
                  key: verifyOTPController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
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
                          SizedBox(width: 10,),
                          Text(
                            StringHelper.back,
                            style: StyleHelper(context).backTextStyle(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          StringHelper.phoneVerification,
                          style: StyleHelper(context).signUpTextStyle(context),
                        ),
                      ),

                      SizedBox(height: 20),
                      Center(
                        child: Text(
                         "Enter your OTP code",
                          style: StyleHelper(context).enterYourOTPCode(context),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildOTPField(verifyOTPController.otpController1, verifyOTPController.focusNode1, verifyOTPController.focusNode2, null),
                            buildOTPField(verifyOTPController.otpController2, verifyOTPController.focusNode2, verifyOTPController.focusNode3, verifyOTPController.focusNode1),
                            buildOTPField(verifyOTPController.otpController3, verifyOTPController.focusNode3, verifyOTPController.focusNode4, verifyOTPController.focusNode2),
                            buildOTPField(verifyOTPController.otpController4, verifyOTPController.focusNode4, verifyOTPController.focusNode5, verifyOTPController.focusNode3),
                            // buildOTPField(verifyOTPController.otpController5, verifyOTPController.focusNode5, verifyOTPController.focusNode6, verifyOTPController.focusNode4),
                            buildOTPField(verifyOTPController.otpController5, verifyOTPController.focusNode5, null, verifyOTPController.focusNode4),
                            ],
                        ),
                      ),
                      // SizedBox(height: 20),
                      // Obx(() {
                      //   return verifyOTPController.errorMessage.isNotEmpty
                      //       ? Text(
                      //     verifyOTPController.errorMessage.value,
                      //     style: TextStyle(color: Colors.red, fontSize: 16),
                      //   )
                      //       : Container();
                      // }),
                      // Obx(() {
                      //   return
                      //     Align(
                      //         alignment: Alignment.bottomRight,
                      //         child:
                      //         TextButton(
                      //           onPressed: verifyOTPController.isButtonDisabled.value
                      //               ? null
                      //               : verifyOTPController.resendOTP,
                      //           child: Text(
                      //             verifyOTPController.isButtonDisabled.value
                      //                 ? "Resend OTP (${verifyOTPController.remainingTime.value})"
                      //                 : "Resend OTP",
                      //             style: TextStyle(
                      //               color: verifyOTPController.isButtonDisabled.value
                      //                   ? Colors.grey
                      //                   : Colors.black,
                      //             ),
                      //           ),
                      //         ));
                      // }),

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(StringHelper.diDntReceiveCode, style: StyleHelper(context).alreadyHaveAnAccountTextStyle(context)),
                            InkWellButtonHelperClass.customTextLink(
                                text: StringHelper.resendAgain,
                                onTap: (){}
                            )
                          ],
                        ),
                      ),
                         Spacer(),
                      // SizedBox(height: MediaQuery.of(context).size.height*.09),
                      ElevatedButtonHelperClass.customElevatedButton(
                          text: StringHelper.verify,
                          onPressed: (){if (verifyOTPController.formKey.currentState?.validate() ?? false)
                          {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SetPassword()));}}),

                                 SizedBox(height: 10,)

                    ],
                  ),
                ),
              ),
            ),
          // )
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
          maxLength: 1, // Limit to 1 character
          focusNode: currentFocus.value,
          decoration: InputDecoration(
            filled: true,
            fillColor:otpField.value.isEmpty ? AppColor.whiteColor1:AppColor.pinkColor3,
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: otpField.value.isEmpty ? AppColor.greyColor : AppColor.pinkColor2, // Change border color based on text
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

