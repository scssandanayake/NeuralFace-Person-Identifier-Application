import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/onboarding_screens_one_screen/onboarding_screens_one_screen.dart';
import '../presentation/onboarding_screens_two_screen/onboarding_screens_two_screen.dart';
import '../presentation/onboarding_screens_three_screen/onboarding_screens_three_screen.dart';
import '../presentation/onboarding_screens_four_screen/onboarding_screens_four_screen.dart';
import '../presentation/main_login_sign_up_screen/main_login_sign_up_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/reset_password_screen/reset_password_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreensOneScreen =
      '/onboarding_screens_one_screen';

  static const String onboardingScreensTwoScreen =
      '/onboarding_screens_two_screen';

  static const String onboardingScreensThreeScreen =
      '/onboarding_screens_three_screen';

  static const String onboardingScreensFourScreen =
      '/onboarding_screens_four_screen';

  static const String mainLoginSignUpScreen = '/main_login_sign_up_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    onboardingScreensOneScreen: (context) => OnboardingScreensOneScreen(),
    onboardingScreensTwoScreen: (context) => OnboardingScreensTwoScreen(),
    onboardingScreensThreeScreen: (context) => OnboardingScreensThreeScreen(),
    onboardingScreensFourScreen: (context) => OnboardingScreensFourScreen(),
    mainLoginSignUpScreen: (context) => MainLoginSignUpScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    resetPasswordScreen: (context) => ResetPasswordScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
