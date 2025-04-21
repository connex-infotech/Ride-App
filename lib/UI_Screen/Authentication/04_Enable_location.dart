import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Uihelper/InkWellButton_HelperClass.dart';
import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../component/colors_helper.dart';
import '../../component/string_helper.dart';
import '05_Welcome _screen.dart';

class EnableLocation extends StatefulWidget {
  const EnableLocation({super.key});

  @override
  _EnableLocationState createState() => _EnableLocationState();
}

class _EnableLocationState extends State<EnableLocation> {
  @override
  void initState() {
    super.initState();

    // Show the dialog after the first frame is drawn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: AlertDialog(
              content: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset("assets/icons/Location(1).svg")),
                      SizedBox(height: MediaQuery.of(context).size.height*.04),
                      Text(
                        StringHelper.enableYourLocation,textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColor.whiteColor1 // Lighter grey for dark mode
                                : AppColor.blackColor1,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          StringHelper.chooseYourLocationToStartFind,
                          textAlign: TextAlign.center, // Align text to the center
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColor.greyColor // Lighter grey for dark mode
                                : AppColor.greyColor1,
                          ),
                        ),
                      ),
                     Spacer(),
                      ElevatedButtonHelperClass.customElevatedButton(
                        text: StringHelper.useMyLocation,
                        onPressed: () {},
                      ),
                      SizedBox(height: 30),
                      InkWellButtonHelperClass.customTextLink(
                        text: StringHelper.skipForNow,
                        textColor: Theme.of(context).brightness == Brightness.dark
                            ? AppColor.greyColor // Lighter grey for dark mode
                            : AppColor.greyColor2,
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:Image.asset("assets/images/try-google-mapping-these-places.webp",fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
