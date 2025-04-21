import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx isObscureText = true.obs;
  Rx isConformPassword = true.obs;

  final TextEditingController setYourNameController = TextEditingController();
  final TextEditingController conformController = TextEditingController();


}