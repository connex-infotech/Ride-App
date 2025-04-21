import 'package:flutter/material.dart';

import '../component/colors_helper.dart';
import '../component/style_helper.dart';

class DropdownHelper {
  static Widget dropdownField({
    required BuildContext context,
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
    required String? Function(String?) validator,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? contentPadding,
    BorderSide? borderColor,
  }) {
    return DropdownButtonFormField<String>(
      value: value.isNotEmpty ? value : null, // Ensure it handles null/empty cases
      decoration: InputDecoration(
        labelText: label,
        labelStyle: StyleHelper.labelStyleTextField,
        border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color:AppColor.greyColor2),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor2),
            ),
            counterText: '',
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            errorStyle: TextStyle(color: AppColor.orangeColor),
          ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: validator,
    );
  }
}

























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DropDownButtonHelper {
//   static Widget customDropdownButton({
//     required RxString selectedValue,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Obx(() {
//       return DropdownButton<String>(
//         value: selectedValue.value,
//         onChanged: onChanged,
//         items: items
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         underline: SizedBox.shrink(),
//           iconEnabledColor: Colors.grey,// Removes the border
//       );
//     });
//   }
// }
