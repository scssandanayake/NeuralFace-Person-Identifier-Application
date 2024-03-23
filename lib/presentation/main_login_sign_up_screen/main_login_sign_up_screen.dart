import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:person_identifier_application/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

import '../login_screen/login_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class MainLoginSignUpScreen extends StatelessWidget {
  const MainLoginSignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgSaly43,
                height: 280.v,
                width: 320.h,
              ),
              SizedBox(height: 23.v),
              Container(
                width: 288.h,
                margin: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  "Enhance your security with NeuralFace, the person detection solution, now just a tap away on your home screen",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumBlack900_1.copyWith(
                    height: 1.71,
                  ),
                ),
              ),
              SizedBox(height: 86.v),
              GestureDetector(
                onTap: () {
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  } catch (e) {
                    print("Error navigating to LoginScreen: $e");
                  }
                },
                child: CustomOutlinedButton(
                  text: "Log In",
                  margin: EdgeInsets.symmetric(horizontal: 10.h),
                ),
              ),
              SizedBox(height: 10.v),
              GestureDetector(
                onTap: () {
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  } catch (e) {
                    print("Error navigating to LoginScreen: $e");
                  }
                },
                child: CustomOutlinedButton(
                  text: "Sign In",
                  margin: EdgeInsets.symmetric(horizontal: 10.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 25.0), // Adjust the top padding as needed
        child: AppbarTitle(
          text: "NeuralFace",
        ),
      ),
    );
  }
}
