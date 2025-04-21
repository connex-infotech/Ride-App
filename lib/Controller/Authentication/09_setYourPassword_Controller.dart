import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetYourNewPasswordController extends GetxController{
 RxBool  isObscureText = true.obs;
 RxBool isConFormPasswordVisible = true.obs;
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 final TextEditingController  enterYourPassword = TextEditingController();
 final TextEditingController  confirmPassword = TextEditingController();

}