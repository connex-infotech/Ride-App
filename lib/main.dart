import 'package:easyrider15/UI_Screen/Authentication/04_Enable_location.dart';
import 'package:easyrider15/UI_Screen/Authentication/07_verify_otp.dart';
import 'package:easyrider15/UI_Screen/Authentication/12_send_verification.dart';
import 'package:easyrider15/UI_Screen/SplashScreens/Splash_Screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'Controller/Onboarding/01_Onboarding_Controller.dart';
import 'UI_Screen/Authentication/05_Welcome _screen.dart';
import 'UI_Screen/Authentication/06_sign_up.dart';
import 'UI_Screen/Authentication/09_set_password.dart';
import 'UI_Screen/Authentication/11_sign_in.dart';
import 'UI_Screen/Authentication/12_Forget_Password.dart';
import 'UI_Screen/Authentication/13_phone_verify_otp.dart';
import 'UI_Screen/Authentication/15_set_new_password.dart';
import 'UI_Screen/Home/16_BottomNavigation_screen.dart';
import 'UI_Screen/Home/16_home_screen_Transport.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Onboarding01Controller onboarding01controller = Get.put(Onboarding01Controller());
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      themeMode: onboarding01controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(), // Define your light theme properties here if needed
      darkTheme: ThemeData.light(),
      home: BottomNavigationHomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
