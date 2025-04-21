import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeScreenController extends GetxController {
  final SearchController searchController = SearchController();
  late int isSelectedType;
  var selectedIndex = 0.obs;  // Track selected index

  void selectContainer(int index) {
    selectedIndex.value = index; // Update selected index
  }
}
