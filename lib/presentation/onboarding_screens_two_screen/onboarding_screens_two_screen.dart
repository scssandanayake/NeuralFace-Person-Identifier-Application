import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class OnboardingScreensTwoScreen extends StatelessWidget {
  const OnboardingScreensTwoScreen({Key? key})
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
                    "NeuralFace",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 25.v),
                CustomImageView(
                  imagePath: ImageConstant.imgSaly12,
                  height: 260.v,
                  width: 320.h,
                ),
                SizedBox(height: 30.v),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.h,
                    vertical: 86.95.v,
                  ),
                  decoration: AppDecoration.fillOnPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Introducing...",
                        style: CustomTextStyles.headlineSmallDMSansBlack900,
                      ),
                      SizedBox(height: 15.v),
                      Container(
                        width: 290.h,
                        margin: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Text(
                          "The power of NeuralFace as it effortlessly identifies individuals, simplifying your daily interactions.",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.71,
                          ),
                        ),
                      ),
                      SizedBox(height: 31.v),

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

  /// Section Widget
  Widget _buildMiniNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            "Skip",
            style: CustomTextStyles.titleMediumBlack900,
          ),
        ),
        Container(
          height: 5.v,
          margin: EdgeInsets.only(
            top: 7.v,
            bottom: 8.v,
          ),
          child: AnimatedSmoothIndicator(
            activeIndex: 0,
            count: 3,
            effect: ScrollingDotsEffect(
              spacing: 8,
              activeDotColor: theme.colorScheme.primary,
              dotColor: theme.colorScheme.primary.withOpacity(0.5),
              dotHeight: 10.v,
              dotWidth: 10.h,
            ),
          ),
        ),
        Text(
          "Next",
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
