import 'package:person_identifier_application/presentation/onboarding_screens_four_screen/controller/onboarding_screens_four_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreensFourScreen.
///
/// This class ensures that the OnboardingScreensFourController is created when the
/// OnboardingScreensFourScreen is first loaded.
class OnboardingScreensFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreensFourController());
  }
}
