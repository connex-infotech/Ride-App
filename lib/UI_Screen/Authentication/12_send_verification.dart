
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/12_send_verification_Controller.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textField_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '../../component/style_helper.dart';
import '../../component/validation_helper.dart';
import '12_Forget_Password.dart';
class SendVerification extends StatelessWidget {
   SendVerification({super.key});
  final SendVerificationController sendVerificationController = Get.put(SendVerificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Form(
                key: sendVerificationController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 15,),
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
                   SizedBox(height: 25),
                   Row(
                     children: [
                       Expanded(
                         child: Text(
                           StringHelper.verificationEmailOrPhoneNumber,
                           style: StyleHelper(context).verificationEmailOrPhoneNumberTextStyle(context),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 25),
                   TextFieldHelperClass.customTextField(
                       controller:  sendVerificationController.emailOrPhoneNumber,
                       hintText: 'Email or phone number',
                       validator: (value)=> ValidationHelper.emailOrPhoneNumberValidator(value)),

                   Spacer(),
                 ElevatedButtonHelperClass.customElevatedButton(
                       text: "Send OTP",
                       onPressed: (){
                    if (sendVerificationController.formKey.currentState
                            ?.validate() ??
                        false) {
                      // If valid, navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    } else {
                      if (kDebugMode) {
                        print("Form is not valid");
                      }
                    }
                  },
                ),
                   SizedBox(height: 10,),

                 ],
                ),
              ),
            ),
          )),
    );
  }
}
