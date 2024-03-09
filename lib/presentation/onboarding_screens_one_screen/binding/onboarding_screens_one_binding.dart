import 'package:person_identifier_application/presentation/onboarding_screens_one_screen/controller/onboarding_screens_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreensOneScreen.
///
/// This class ensures that the OnboardingScreensOneController is created when the
/// OnboardingScreensOneScreen is first loaded.
class OnboardingScreensOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreensOneController());
  }
}
