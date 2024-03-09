import '../../../core/app_export.dart';
import '../models/onboarding_screens_one_model.dart';

/// A controller class for the OnboardingScreensOneScreen.
///
/// This class manages the state of the OnboardingScreensOneScreen, including the
/// current onboardingScreensOneModelObj
class OnboardingScreensOneController extends GetxController {
  Rx<OnboardingScreensOneModel> onboardingScreensOneModelObj =
      OnboardingScreensOneModel().obs;
}
