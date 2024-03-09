import 'package:person_identifier_application/presentation/onboarding_screens_two_screen/controller/onboarding_screens_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreensTwoScreen.
///
/// This class ensures that the OnboardingScreensTwoController is created when the
/// OnboardingScreensTwoScreen is first loaded.
class OnboardingScreensTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreensTwoController());
  }
}
