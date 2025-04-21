
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Uihelper/elevatedButton_HelperClass.dart';
import '../../Uihelper/textButton_HelperClass.dart';
import '../../component/colors_helper.dart';
import '06_sign_up.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 90,),
              SvgPicture.asset("assets/images/WelcomeScreen_image.svg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text("Welcome",
                      style: TextStyle( color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.whiteColor1
                          : AppColor.blackColor1,
                          fontWeight: FontWeight.w500,fontSize: 24,fontFamily: "Poppins"),),
                    SizedBox(height: 10,),
                    Text("Have a better sharing experience",style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColor.greyColor // Lighter grey for dark mode
                            : AppColor.greyColor1,
                        fontWeight: FontWeight.w400,fontSize: 16,fontFamily: "Poppins"),),
                  ],
                ),
              ),
             Spacer(),
           ElevatedButtonHelperClass.customElevatedButton(
               text:"Create an account",
               onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUP()));}),

              SizedBox(height: 13,),
              TextButtonHelperClass.customTextButton(
                  text: "Log In",
                  height: 54,
                  onPressed: (){}),
              SizedBox(height: 20,),


            ],
          ),
        ),
      )),
    );
  }
}
