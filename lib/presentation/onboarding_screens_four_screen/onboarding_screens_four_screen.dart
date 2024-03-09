import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';
import 'controller/onboarding_screens_four_controller.dart';

// ignore_for_file: must_be_immutable
class OnboardingScreensFourScreen
    extends GetWidget<OnboardingScreensFourController> {
  const OnboardingScreensFourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(1, 0.59),
              colors: [
                appTheme.teal200,
                appTheme.lime100,
              ],
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 60.v),
                Container(
                  decoration: AppDecoration.outlineBlack,
                  child: Text(
                    "lbl_neuralface".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 25.v),
                CustomImageView(
                  imagePath: ImageConstant.imgSaly1,
                  height: 260.v,
                  width: 320.h,
                ),
                SizedBox(height: 30.v),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                    vertical: 65.v,
                  ),
                  decoration: AppDecoration.fillOnPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "msg_welcome_to_surf".tr,
                        style: CustomTextStyles.headlineSmallDMSansBlack900,
                      ),
                      SizedBox(height: 29.v),
                      Container(
                        width: 290.h,
                        margin: EdgeInsets.symmetric(horizontal: 5.h),
                        child: Text(
                          "msg_lorem_ipsum_is_simply".tr,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.71,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.v),
                      CustomElevatedButton(
                        text: "lbl_get_started".tr,
                      ),
                      SizedBox(height: 9.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
