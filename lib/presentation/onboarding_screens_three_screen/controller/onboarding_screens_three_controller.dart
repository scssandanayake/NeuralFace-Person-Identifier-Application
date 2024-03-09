import '../../../core/app_export.dart';
import '../models/onboarding_screens_three_model.dart';

/// A controller class for the OnboardingScreensThreeScreen.
///
/// This class manages the state of the OnboardingScreensThreeScreen, including the
/// current onboardingScreensThreeModelObj
class OnboardingScreensThreeController extends GetxController {
  Rx<OnboardingScreensThreeModel> onboardingScreensThreeModelObj =
      OnboardingScreensThreeModel().obs;
}
