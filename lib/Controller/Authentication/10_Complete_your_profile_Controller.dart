import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../component/colors_helper.dart';

class CompleteYourProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  var imageFile = Rx<File?>(null);

  final TextEditingController fullNAme = TextEditingController();
  final TextEditingController yourMobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  Rx<String> selectedCity = Rx<String>('');
  Rx<String> selectedDistrict = Rx<String>('');

  List<String> cityList = ['ddb3b3', 'v2w2ddd', 'g3455gg'];
  List<String> districtList = ['ddb3b3', 'v2w2ddd', 'g3455gg'];

  RxBool isChecked = false.obs;
  Future<void> pickImage() async {

    final pickedSource = await Get.bottomSheet<ImageSource>(
      Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 33,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black, // Icon color
                      size: 15, // Adjust icon size
                    ),
                    onPressed: () {
                      Get.back(); // Close the bottom sheet when the close button is pressed
                    },
                  ),
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextButton(
                style: TextButton.styleFrom(
                  // The button style is empty, you can add custom styles if required
                ),
                onPressed: () {
                  Get.back(result: ImageSource.camera); // Return camera as the picked source
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     AppColor.elevatedButtonTopCenterBlue,
                    //     AppColor.elevatedButtonBottomCenterBlue
                    //   ], // Set your desired gradient colors here
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    borderRadius: BorderRadius.circular(30), // Set a higher value for round shape
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Padding for button
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, color: Colors.black), // Camera icon
                      Text(
                        '    Camera', // Button text
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Button for Gallery
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: TextButton(
                  style: TextButton.styleFrom(
                  ),
                  onPressed: () {
                    Get.back(result: ImageSource.gallery); // Return camera as the picked source
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // gradient: LinearGradient(
                      //   colors: [AppColor.elevatedButtonTopCenterBlue,AppColor.elevatedButtonBottomCenterBlue ], // Set your desired gradient colors here
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      // ),
                      borderRadius: BorderRadius.circular(30), // Optional: to round the corners
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_album_outlined, color: Colors.black),
                        Text(
                          'Gallery',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );

    if (pickedSource != null) {
      print('Picked source: $pickedSource');
      // Now use the selected source (either Camera or Gallery)
      final pickedFile = await _picker.pickImage(source: pickedSource);

      if (pickedFile != null) {
        print('Picked image: ${pickedFile.path}');
        imageFile.value = File(pickedFile.path); // Update the image file
      } else {
        print('No image picked');
      }
    } else {
      print('No source selected');
    }}
}