import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailOrPhoneNumberController = TextEditingController();
  final TextEditingController enterYorPasswordController = TextEditingController();

}