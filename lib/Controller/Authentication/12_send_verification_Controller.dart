
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendVerificationController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailOrPhoneNumber = TextEditingController();
}