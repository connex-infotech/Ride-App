
import 'package:flutter/material.dart';
import '../component/colors_helper.dart';
import '../component/style_helper.dart';

class ElevatedButtonHelperClass {
  static Widget customElevatedButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = const Color(0xffED39A2),
    double height = 54.0,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w500,
    bool useGradient = true,  // New parameter to control gradient
    Color textColor = const Color(0XFFFFFFFF), // Default text color
    TextStyle? textStyle, // Optional text style
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.pinkColor1
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          minimumSize: Size(double.infinity, height),
          shadowColor: Colors.transparent, // Optional: remove shadow
        ),
        child: Text(
          text,
          style: textStyle ??
              StyleHelper.baseElevatedButtonTextStyle.copyWith(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}























// import 'package:flutter/material.dart';
// import '../component/colors_helper.dart';
// import '../component/style_helper.dart';
//
// class ElevatedButtonHelperClass {
//   static Widget customElevatedButton({
//     required String text,
//     required VoidCallback onPressed,
//     Color color = Colors.blue,
//     double height = 49.0,
//     fontSize = 18.0,
//     fontWeight = FontWeight.w500,
//
//
//     bool useGradient = true,  // New parameter to control gradient
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: useGradient
//             ? LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             AppColor.elevatedButtonBlueTopCenter,
//             AppColor.elevatedButtonBlueBottomCenter,
//           ],
//         )
//             : null, // No gradient if useGradient is false
//         color: !useGradient ? color : null, // Use solid color if no gradient
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent, // Transparent to show the gradient or color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           minimumSize: Size(double.infinity, height),
//           shadowColor: Colors.transparent, // Optional: remove shadow
//         ),
//         child: Text(
//                  text,
//                       style:  StyleHelper.baseElevatedButtonTextStyle
//         ),
//       ),
//     );
//   }
// }
