import 'package:flutter/material.dart';
import 'colors_helper.dart';

class StyleHelper {
  StyleHelper(BuildContext context, {required});

  TextStyle skipText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColor.blackColor,
  );

  static TextStyle baseElevatedButtonTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColor.whiteColor1,
  );

  // This method will take context as an argument (which is passed when calling the method)

  TextStyle anyWhereYouAre(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.whiteColor1
          : AppColor.blackColor1, // Dynamically change color based on theme
      fontSize: 24,
      fontWeight: FontWeight.w500,
    );
  }

  // Optionally, another method for dynamic styling
  TextStyle dynamicTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.whiteColor1
          : AppColor.blackColor1, // Adjust text color based on theme
    );
  }

  static TextStyle labelStyleTextField = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );

  static TextStyle errorStyleTextField =
      TextStyle(color: Colors.red, fontSize: 12);

  TextStyle backTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.whiteColor2
          : AppColor.blackColor, // Adjust text color based on theme
    );
  }

  TextStyle signUpTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.whiteColor2
          : AppColor.blackColor,
    );
  }

  TextStyle alreadyHaveAnAccountTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.greyColor
          : AppColor.blackColor3,
    );
  }

  static TextStyle or = TextStyle(
      fontFamily: "Poppins",
      color: AppColor.greyColor2,
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static TextStyle bysigningupyouagreetothe = TextStyle(
      fontFamily: "Poppins",
      color: AppColor.greyColor2,
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static TextStyle termsofService = TextStyle(
      fontFamily: "Poppins",
      color: AppColor.pinkColor,
      fontSize: 16,
      fontWeight: FontWeight.w500);

      TextStyle enterYourOTPCode(BuildContext context) {
    return TextStyle(
    fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.greyColor
          : AppColor.greyColor1,
    );
  }
  TextStyle verificationEmailOrPhoneNumberTextStyle(BuildContext context) {
  return TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Theme.of(context).brightness == Brightness.dark
  ? AppColor.whiteColor1
      : AppColor.blackColor1,
  );
  }
}
