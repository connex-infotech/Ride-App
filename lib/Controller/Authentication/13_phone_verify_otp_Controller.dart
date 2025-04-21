import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneVerifyOTPController extends GetxController{
  final formKey = GlobalKey<FormState>();

  var otpController1 = ''.obs;
  var otpController2 = ''.obs;
  var otpController3 = ''.obs;
  var otpController4 = ''.obs;
  var otpController5 = ''.obs;
  // var otpController6 = ''.obs;

  // Observable focus nodes for each OTP field
  var focusNode1 = FocusNode().obs;
  var focusNode2 = FocusNode().obs;
  var focusNode3 = FocusNode().obs;
  var focusNode4 = FocusNode().obs;
  var focusNode5 = FocusNode().obs;
  // var focusNode6 = FocusNode().obs;

  // Error message to display
  var errorMessage = ''.obs;

  // Correct OTP for validation
  final String correctOtp = "12345";

  // Observable state for button and timer
  var isButtonDisabled = false.obs;
  var remainingTime = 30.obs; // Observable state for remaining time
  late Timer _timer;

  // Method to validate OTP
  validateOtp() {
    String enteredOtp = otpController1.value +
        otpController2.value +
        otpController3.value +
        otpController4.value +
        otpController5.value ;
    // otpController6.value;

    if (enteredOtp == correctOtp) {
      errorMessage.value = '';
      Get.snackbar("Success", "OTP Verified Successfully!");
      // Get.to(homeScreen());

    } else {
      errorMessage.value = "Invalid OTP, please try again.";
    }
  }


  void _startTimer() {
    isButtonDisabled.value = true; // Disable the button initially
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        isButtonDisabled.value = false; // Enable the button when the timer ends
        _timer.cancel(); // Stop the timer
      }
    });
  }

  // Method to resend OTP and reset the timer
  void resendOTP() {
    print("OTP Resent");

    // Restart the timer after OTP is resent
    remainingTime.value = 30;
    isButtonDisabled.value = true;
    _startTimer();
  }

  // Method to move focus to the next input field
  void moveFocus(FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(Get.context!).requestFocus(nextFocus);
  }

  // Method to handle text change and move focus automatically
  void onOtpChanged(String value, FocusNode currentFocus, FocusNode nextFocus) {
    if (value.length == 1) {
      moveFocus(currentFocus, nextFocus);
    }
  }

}