import '../../../core/app_export.dart';
import '../models/onboarding_screens_four_model.dart';

/// A controller class for the OnboardingScreensFourScreen.
///
/// This class manages the state of the OnboardingScreensFourScreen, including the
/// current onboardingScreensFourModelObj
class OnboardingScreensFourController extends GetxController {
  Rx<OnboardingScreensFourModel> onboardingScreensFourModelObj =
      OnboardingScreensFourModel().obs;
}
