import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {


 RxBool isChecked = false.obs;
 final formKey = GlobalKey<FormState>();


 // Rx selectedGender= Rx<String?>(null);
 Rx<String> selectedGender = Rx<String>('');
 List<String> genderList = ['Male', 'Female', 'Other'];

 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController yourMobileNumberController = TextEditingController();
 final TextEditingController genderController = TextEditingController();
}
