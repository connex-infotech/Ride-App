import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForGotPasswordController extends GetxController {
  // List of icons for different selection types
  final List<String> items = [
    "assets/icons/ForgotPassword_message_icon_image.svg",
    "assets/icons/ForgotPassword_email_icon_image.svg",
  ].obs;

  // List of names for the selection options (e.g., Via SMS, Via Email)
  final List<String> items1 = ["Via SMS", "Via email"];

  final List<String> items2 = ["***** ***70", "**** **** **** xyz@xyz.com"];

  RxList<Map<String, String>> combinedItems = RxList<Map<String, String>>();

  Rx<Map<String, String>> selectedItem = Rx<Map<String, String>>({});

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < items.length; i++) {
      combinedItems.add({
        "icon": items[i],
        "name": items1[i],
        "message": items2[i],
      });
    }
  }
}















//  import 'package:get/get.dart';
//
// class ForGotPasswordController extends GetxController{
//
//   final List<String> items = [
//     "assets/icons/ForgotPassword_message_icon_image.svg",
//     "assets/icons/ForgotPassword_email_icon_image.svg",].obs;
//
//   final List<String> items1 = ["Via SMS","Via email"];
//   final List<String> items2 = ["***** ***70","**** **** **** xyz@xyz.com"];
//
//
//
// }