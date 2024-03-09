import 'package:person_identifier_application/presentation/onboarding_screens_three_screen/controller/onboarding_screens_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreensThreeScreen.
///
/// This class ensures that the OnboardingScreensThreeController is created when the
/// OnboardingScreensThreeScreen is first loaded.
class OnboardingScreensThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreensThreeController());
  }
}
