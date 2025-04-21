
import 'package:easyrider15/component/common_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../Controller/Authentication/11_sign_in_Controller.dart';
import '../../Uihelper/InkWellButton_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textField_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../../component/validation_helper.dart';
import '12_send_verification.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final SignInController signInController = Get.put(SignInController());

  // Define a GlobalKey for form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form( // Wrap the form fields inside a Form widget
              key: formKey, // Pass the formKey to the Form widget
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 30),
                    Text(
                      StringHelper.signIn,
                      style: StyleHelper(context).signUpTextStyle(context),
                    ),
                    SizedBox(height: 20),
                    TextFieldHelperClass.customTextField(
                      controller: signInController.emailOrPhoneNumberController,
                      hintText: "Email or Phone Number",
                      validator: (value) => ValidationHelper.emailOrPhoneNumberValidator(value),
                    ),
                    CommonHelper.sizedBoxBtnTextField(),
                    TextFieldHelperClass.customTextField(
                      controller: signInController.enterYorPasswordController,
                      hintText: "Enter Your Password",
                      validator: (value) => ValidationHelper.passwordValidator(value), // Add password validator if needed
                    ),
                
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWellButtonHelperClass.customTextLink(
                        text: "Forget password?",
                        textColor: AppColor.orangeColor,
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SendVerification()));},
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButtonHelperClass.customElevatedButton(
                      text: "Sign In",
                      onPressed: () {
                        // Trigger form validation
                        if (formKey.currentState?.validate() ?? false) {
                          // If valid, navigate to the next screen
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SendVerification()),
                          // );
                        } else {
                          // Optionally show an error message or highlight invalid fields
                          print("Form is not valid");
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.33,
                            color: AppColor.greyColor2,
                          ),
                          Text(StringHelper.or, style: StyleHelper.or),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.33,
                            color: AppColor.greyColor2,
                          ),
                        ],
                      ),
                    ),
                   SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColor.greyColor,
                              ),
                            ),
                            child: Center(
                                child: SvgPicture.asset("assets/icons/06_sign_Up_gmail.svg")),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: SvgPicture.asset("assets/icons/06_Sign_Up_Facebook.svg"),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: SvgPicture.asset("assets/icons/06_Sign_Up_Apple.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StringHelper.alreadyHaveAnAccount,
                              style: StyleHelper(context).alreadyHaveAnAccountTextStyle(context)),
                          InkWellButtonHelperClass.customTextLink(
                            text: StringHelper.signUp,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
