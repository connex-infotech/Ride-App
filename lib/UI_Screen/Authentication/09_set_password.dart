import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/09_setYourPassword_Controller.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textField_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../../component/validation_helper.dart';
import '10_Complete_your_profile.dart';

class SetPassword extends StatelessWidget {
  final SetYourNewPasswordController setYourPasswordController =
  Get.put(SetYourNewPasswordController());

  SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: setYourPasswordController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {Navigator.of(context).pop();},
                            // Go back
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
                          StringHelper.setPassword,
                          style: StyleHelper(context).signUpTextStyle(context),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          StringHelper.setYourPassword,
                          style: StyleHelper(context).enterYourOTPCode(context),
                        ),
                      ),
                      SizedBox(height: 50),
                      Obx(
                            () {
                          return TextFieldHelperClass.customTextField(
                            controller: setYourPasswordController.enterYourPassword,
                            isPassword: true,
                            isObscure: setYourPasswordController.isObscureText.value,
                            hintText: "Enter Your Password",
                            validator: (value) =>
                                ValidationHelper.passwordValidator(value),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    setYourPasswordController.isObscureText.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColor.greyColor2
                                        : AppColor.greyColor3),
                                onPressed: () {
                                  setYourPasswordController.isObscureText.toggle();
                                }),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Obx(() {
                        return TextFieldHelperClass.customTextField(
                          controller: setYourPasswordController.confirmPassword,
                          isPassword: true,
                          isObscure: setYourPasswordController.isConFormPasswordVisible.value,
                          hintText: "Confirm Password",
                          validator: (value) => ValidationHelper.confirmPasswordValidator(
                            value,
                            setYourPasswordController.enterYourPassword.text, // Pass the password
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  setYourPasswordController.isConFormPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? AppColor.greyColor2
                                      : AppColor.greyColor3),
                              onPressed: () {
                                setYourPasswordController.isConFormPasswordVisible.toggle();
                              }),
                        );
                      })
                    ],
                  ),
                  Spacer(), // Adjusted space
                  ElevatedButtonHelperClass.customElevatedButton(
                    text: "Register",
                    onPressed: () {
                      if (setYourPasswordController.formKey.currentState?.validate() ?? true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompleteYourProfile()));
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // ValidationHelper.dart
// class ValidationHelper {
//   static String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password cannot be empty';
//     }
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
//
//   static String? confirmPasswordValidator(String? value, String password) {
//     if (value == null || value.isEmpty) {
//       return 'Confirm Password cannot be empty';
//     }
//     if (value != password) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }
// }
