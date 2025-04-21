// import 'package:get/get.dart';
// import 'package:location/location.dart';
//
// class LocationController extends GetxController {
//   var isLocationEnabled = false.obs;
//   var hasLocationPermission = false.obs;
//   var isDialogVisible = false.obs;
//
//   Location _location = Location();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _checkLocationService();
//   }
//
//   // Check if location service is enabled and if permission is granted
//   void _checkLocationService() async {
//     bool serviceEnabled = await _location.serviceEnabled();
//     if (!serviceEnabled) {
//       isDialogVisible.value = true;
//     } else {
//       _checkLocationPermission();
//     }
//   }
//
//   // Check for location permission
//   void _checkLocationPermission() async {
//     PermissionStatus permissionStatus = await Permission.location.status;
//     if (permissionStatus.isGranted) {
//       hasLocationPermission.value = true;
//     } else {
//       await Permission.location.request();
//       permissionStatus = await Permission.location.status;
//       hasLocationPermission.value = permissionStatus.isGranted;
//     }
//   }
//
//   // Enable location service
//   void enableLocation() async {
//     await _location.requestService();
//     _checkLocationService();
//   }
//
//   // Disable location service
//   void disableLocation() {
//     isDialogVisible.value = false;
//   }
// }
//
// extension on PermissionStatus {
//   bool get isGranted => isGranted;
// }
//
// class Permission {
//   static var location;
// }
