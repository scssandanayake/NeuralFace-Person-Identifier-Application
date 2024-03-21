import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeScreenTemporaryPage extends StatelessWidget {
  const HomeScreenTemporaryPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 9.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(5.h),
                  decoration: AppDecoration.fillTeal.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder17,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage,
                        height: 25.adaptSize,
                        width: 25.adaptSize,
                        radius: BorderRadius.circular(
                          12.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 4.v,
                        ),
                        child: Text(
                          "dr.Rasika",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 45.v),
              CustomImageView(
                imagePath: ImageConstant.imgBackgroundImage,
                height: 260.v,
                width: 320.h,
              ),
              SizedBox(height: 33.v),
              Container(
                width: 290.h,
                margin: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the same industry's standard dummy text ever since the 1500s.!",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.71,
                  ),
                ),
              ),
              SizedBox(height: 23.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quick Start Guide",
                    style: CustomTextStyles.titleMediumTeal60001,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                    margin: EdgeInsets.only(left: 6.h),
                  ),
                ],
              ),
              SizedBox(height: 45.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "NeuralFace",
      ),
    );
  }
}
