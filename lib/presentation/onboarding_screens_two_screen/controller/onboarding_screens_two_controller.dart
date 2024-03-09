import '../../../core/app_export.dart';
import '../models/onboarding_screens_two_model.dart';

/// A controller class for the OnboardingScreensTwoScreen.
///
/// This class manages the state of the OnboardingScreensTwoScreen, including the
/// current onboardingScreensTwoModelObj
class OnboardingScreensTwoController extends GetxController {
  Rx<OnboardingScreensTwoModel> onboardingScreensTwoModelObj =
      OnboardingScreensTwoModel().obs;
}
