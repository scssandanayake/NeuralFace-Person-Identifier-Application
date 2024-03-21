import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [

                      _buildScreenTitle(
                      context,
                      screenTitle: "splash screen ",
                      onTapScreenTitle: () =>
                          onTapScreenTitle(context, AppRoutes.splashScreen),
                    ),
                    _buildScreenTitle(
                      context,
                      screenTitle: "Onboarding screens One",
                      onTapScreenTitle: () => onTapScreenTitle(
                          context, AppRoutes.onboardingScreensOneScreen),
                    ),
                    _buildScreenTitle(
                      context,
                      screenTitle: "Onboarding screens Two",
                      onTapScreenTitle: () => onTapScreenTitle(
                          context, AppRoutes.onboardingScreensTwoScreen),
                    ),
                    _buildScreenTitle(
                      context,
                      screenTitle: "Onboarding screens Three",
                      onTapScreenTitle: () => onTapScreenTitle(
                          context, AppRoutes.onboardingScreensThreeScreen),
                    ),
                    _buildScreenTitle(
                      context,
                      screenTitle: "Onboarding screens Four",
                      onTapScreenTitle: () => onTapScreenTitle(
                          context, AppRoutes.onboardingScreensFourScreen),
                    ),

                        _buildScreenTitle(
                          context,
                          screenTitle: "main login/sign up screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.mainLoginSignUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "sign up screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "reset password screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.resetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "temporary home screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeScreenTemporaryPage),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "home screen container screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeScreenTemporaryContainerScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
