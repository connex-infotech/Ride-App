




import 'package:easyrider15/component/common_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/10_Complete_your_profile_Controller.dart';
import '../../Uihelper/DropDownButton.dart';
import '../../Uihelper/PhoneNumberTextField_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textField_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../../component/validation_helper.dart';
import '11_sign_in.dart';

class CompleteYourProfile extends StatelessWidget {
  CompleteYourProfile({super.key});

  final CompleteYourProfileController completeYourProfileController =
  Get.put(CompleteYourProfileController());

  // Add GlobalKey for FormState
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
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
                      Expanded(
                        child: Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 15,
                        color: Colors.transparent,
                      ),
                      SizedBox(width: 10),
                      Text(
                        StringHelper.back,
                        style: TextStyle(color: Colors.transparent),
                      ),
                    ],
                  ),
  SizedBox(height: 30),
                  // Profile Picture Section
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: ClipOval(
                          child: completeYourProfileController.imageFile.value != null
                              ? Image.file(
                            completeYourProfileController.imageFile.value!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            "assets/images/Admin_DashBoard_Screen_ImageWelcome.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 90,
                        child: GestureDetector(
                          onTap: () {
                            completeYourProfileController.pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Form Section
                  Form(
                    key: formKey, // Use the formKey here
                    child: Column(
                      children: [
                        TextFieldHelperClass.customTextField(
                          controller: completeYourProfileController.fullNAme,
                          hintText: "Full Name",
                          validator: (value) => ValidationHelper.nameValidator(value),
                        ),
                        CommonHelper.sizedBoxBtnTextField(),
                        PhoneNumberFormField.customPhoneNumberField(
                          controller: completeYourProfileController.yourMobileNumber,
                          initialCountryCode: 'BD',
                          onChanged: (phone) {},
                        ),
                        CommonHelper.sizedBoxBtnTextField(),
                        TextFieldHelperClass.customTextField(
                          controller: completeYourProfileController.email,
                          hintText: "Email",
                          validator: (value) => ValidationHelper.emailValidator(value),
                        ),
                        CommonHelper.sizedBoxBtnTextField(),
                        TextFieldHelperClass.customTextField(
                          controller: completeYourProfileController.street,
                          hintText: "Street",
                          validator: (value) => ValidationHelper.emailValidator(value),
                        ),

                        CommonHelper.sizedBoxBtnTextField(),
    Obx(() {
      return DropdownHelper.dropdownField(
        context: context,
        label: "Select city",
        value: completeYourProfileController.selectedCity.value,
        onChanged: (newValue) {
          completeYourProfileController .selectedCity.value;
        },
        items: completeYourProfileController.cityList,
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

     CommonHelper.sizedBoxBtnTextField(),
    Obx(() {
      return DropdownHelper.dropdownField(
        context: context,
        label: "Select District",
        value: completeYourProfileController.selectedDistrict.value,
        onChanged: (newValue) {
          completeYourProfileController.selectedDistrict.value;
        },
        items: completeYourProfileController.districtList,
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

       SizedBox(height: MediaQuery.of(context).size.height*.05),
                        Row(
                    children: [
                            Expanded(
                              child: ElevatedButtonHelperClass.customElevatedButton(
                                backgroundColor: Colors.white,
                                text: "Style",
                                textColor: AppColor.blackColor,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButtonHelperClass.customElevatedButton(
                                text: "Save",
                                onPressed: () {
                                  // Trigger validation on form
                                  if (formKey.currentState?.validate() ?? false) {
                                    // Proceed to the next screen if valid
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => SignIn()),
                                    // );
                                  } else {
                                    // Optionally, show some error message or highlight the invalid fields
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
