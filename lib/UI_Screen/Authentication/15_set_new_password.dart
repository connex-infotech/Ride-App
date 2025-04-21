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

class SetNewPassword extends StatelessWidget {
  final SetYourNewPasswordController setYourNewPasswordController =
  Get.put(SetYourNewPasswordController());

  SetNewPassword({super.key});

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
              key: setYourNewPasswordController.formKey,
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
                          StringHelper.setNewPassword,
                          style: StyleHelper(context).signUpTextStyle(context),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          StringHelper.setYourNewPassword,
                          style: StyleHelper(context).enterYourOTPCode(context),
                        ),
                      ),
                      SizedBox(height: 50),
                      Obx(
                            () {
                          return TextFieldHelperClass.customTextField(
                            controller: setYourNewPasswordController.enterYourPassword,
                            isPassword: true,
                            isObscure: setYourNewPasswordController.isObscureText.value,
                            hintText: "Enter Your  New Password",
                            validator: (value) =>
                                ValidationHelper.passwordValidator(value),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    setYourNewPasswordController.isObscureText.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColor.greyColor2
                                        : AppColor.greyColor3),
                                onPressed: () {
                                  setYourNewPasswordController.isObscureText.toggle();
                                }),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Obx(() {
                        return TextFieldHelperClass.customTextField(
                          controller: setYourNewPasswordController.confirmPassword,
                          isPassword: true,
                          isObscure: setYourNewPasswordController.isConFormPasswordVisible.value,
                          hintText: "Confirm Password",
                          validator: (value) => ValidationHelper.confirmPasswordValidator(
                            value,
                            setYourNewPasswordController.enterYourPassword.text, // Pass the password
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  setYourNewPasswordController.isConFormPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? AppColor.greyColor2
                                      : AppColor.greyColor3),
                              onPressed: () {
                                setYourNewPasswordController.isConFormPasswordVisible.toggle();
                              }),
                        );
                      })
                    ],
                  ),
                  Spacer(), // Adjusted space
                  ElevatedButtonHelperClass.customElevatedButton(
                    text: "Register",
                    onPressed: () {
                      if (setYourNewPasswordController.formKey.currentState?.validate() ?? true) {

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