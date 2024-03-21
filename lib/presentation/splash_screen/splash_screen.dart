import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:person_identifier_application/core/app_export.dart';

import '../../home_screen.dart';
import '../../home_screen.dart';
import '../../main.dart';
import '../app_navigation_screen/onboard_screen.dart';
import '../main_login_sign_up_screen/main_login_sign_up_screen.dart';
import '../onboarding_screens_one_screen/onboarding_screens_one_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to HomeScreen after 2 seconds
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => isViewed !=0 ?  OnBoardingScreen() :  MainLoginSignUpScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to get the top and bottom again
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(1, 0.59),
              colors: [
                appTheme.teal200,
                appTheme.lime100,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgSaly44,
                  height: 260.v,
                  width: 320.h,
                ),
                SizedBox(height: 5.v),
                Container(
                  decoration: AppDecoration.outlineBlack,
                  child: Text(
                    "NeuralFace",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
