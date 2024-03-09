import 'package:get/get.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/onboarding_screens_one_screen/onboarding_screens_one_screen.dart';
import '../presentation/onboarding_screens_one_screen/binding/onboarding_screens_one_binding.dart';
import '../presentation/onboarding_screens_two_screen/onboarding_screens_two_screen.dart';
import '../presentation/onboarding_screens_two_screen/binding/onboarding_screens_two_binding.dart';
import '../presentation/onboarding_screens_three_screen/onboarding_screens_three_screen.dart';
import '../presentation/onboarding_screens_three_screen/binding/onboarding_screens_three_binding.dart';
import '../presentation/onboarding_screens_four_screen/onboarding_screens_four_screen.dart';
import '../presentation/onboarding_screens_four_screen/binding/onboarding_screens_four_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

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

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreensOneScreen,
      page: () => OnboardingScreensOneScreen(),
      bindings: [
        OnboardingScreensOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreensTwoScreen,
      page: () => OnboardingScreensTwoScreen(),
      bindings: [
        OnboardingScreensTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreensThreeScreen,
      page: () => OnboardingScreensThreeScreen(),
      bindings: [
        OnboardingScreensThreeBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreensFourScreen,
      page: () => OnboardingScreensFourScreen(),
      bindings: [
        OnboardingScreensFourBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
