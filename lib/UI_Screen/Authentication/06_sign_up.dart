
import 'package:easyrider15/component/common_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../Controller/Authentication/06_sign_up_Controller.dart';
import '../../Uihelper/DropDownButton.dart';
import '../../Uihelper/InkWellButton_HelperClass.dart';
import '../../Uihelper/PhoneNumberTextField_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textField_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../../component/validation_helper.dart';
import '07_verify_otp.dart';
import '11_sign_in.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: signUpController.formKey, // Attach the form key here
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Row(
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
                      Text(
                        StringHelper.signup,
                        style: StyleHelper(context).signUpTextStyle(context),
                      ),
                      SizedBox(height: 25),
                      TextFieldHelperClass.customTextField(
                        controller: signUpController.nameController,
                        hintText: "Name",
                        validator: (value) =>
                            ValidationHelper.nameValidator(value),
                      ),
               CommonHelper.sizedBoxBtnTextField(),
                      TextFieldHelperClass.customTextField(
                        controller: signUpController.emailController,
                        hintText:
                        StringHelper.email,
                        validator: (value) =>
                            ValidationHelper.emailValidator(value),
                      ),
                      CommonHelper.sizedBoxBtnTextField(),
                      PhoneNumberFormField.customPhoneNumberField(
                        controller: signUpController.yourMobileNumberController,
                        initialCountryCode: 'BD',
                        onChanged: (phone) {},
                      ),
                      CommonHelper.sizedBoxBtnTextField(),
                      Obx(() {
                        return DropdownHelper.dropdownField(
                            context: context,
                            label: "Select Gender",
                            value: signUpController.selectedGender.value,
                            onChanged: (newValue) {
                              signUpController.selectedGender.value;
                            },
                            items: signUpController.genderList,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a gender';
                              }
                              return null;
                            },
                            labelStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                            borderColor: BorderSide(color: Colors.blue),
                          );
                      }),

                      SizedBox(height: 15),

                   Obx(() =>  Row(
                   children: [
                    Checkbox(
                      value: signUpController.isChecked.value,
                      onChanged: (bool? value) {
                        signUpController.isChecked.value = value ?? false;
                        print("isChecked ${signUpController.isChecked.value}");
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: BorderSide(color: Colors.green),
                      activeColor: Colors.green,
                      // checkColor: Colors.green,
                      // fillColor: Colors.green,
                     ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),

                          children: <TextSpan>[
                            TextSpan(text: StringHelper.bySigningUpYouAgree,style: StyleHelper.bysigningupyouagreetothe),
                            TextSpan(
                              text: StringHelper.termsOfService,
                              style: StyleHelper.termsofService,
                            ),
                            TextSpan(text:' and',style: StyleHelper.bysigningupyouagreetothe),
                            TextSpan(
                              text:StringHelper.privacyPolicy,
                              style: StyleHelper.termsofService),
                          ],),),
                             ),
                             ],
                         ),),

                      SizedBox(height: 15),
                      ElevatedButtonHelperClass.customElevatedButton(
                        text: StringHelper.signUp,
                        onPressed: () {
                          if (signUpController.formKey.currentState?.validate() ??
                              false) {
                            if (signUpController.isChecked.value) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerifyOTP()));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please accept the terms and conditions.',style: TextStyle(color: Colors.white),),
                                  backgroundColor: Colors.red,
                                    // behavior: SnackBarBehavior.fixed,
                                ),
                              );
                            }
                          }
                          },
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.37,
                                color: AppColor.greyColor2),
                            Text(StringHelper.or,
                                style: StyleHelper.or),
                            Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.37,
                                color: AppColor.greyColor2),
                          ],
                        ),
                      ),

                            SizedBox(height: 20,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:90.0),
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
                        )
                      ),
                      child: Center(child: SvgPicture.asset("assets/icons/06_sign_Up_gmail.svg",)),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                          )
                      ),
                      child: SvgPicture.asset("assets/icons/06_Sign_Up_Facebook.svg",),
                    ),
                    Container(
                      height: 48, width: 48,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: SvgPicture.asset("assets/icons/06_Sign_Up_Apple.svg",),
                    ),
                  ],
                              ),
                            ),
                    Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(StringHelper.alreadyHaveAnAccount, style: StyleHelper(context).alreadyHaveAnAccountTextStyle(context)),
                           InkWellButtonHelperClass.customTextLink(
                               text: StringHelper.signIn,
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>SignIn()));}
                           )
                         ],
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
