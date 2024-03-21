import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

// ignore_for_file: must_be_immutable
class PermissionScreenTwoDialog extends StatelessWidget {
  const PermissionScreenTwoDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgFolder,
                height: 32.adaptSize,
                width: 32.adaptSize,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              SizedBox(height: 18.v),
              Opacity(
                opacity: 0.8,
                child: SizedBox(
                  width: 249.h,
                  child: Text(
                    "Allow Nuralface to access photos, media, and files on your device?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.63,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 29.v),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              children: [
                CustomElevatedButton(
                  height: 56.v,
                  text: "Allow",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleSmallRobotoOnPrimary,
                ),
                SizedBox(height: 4.v),
                CustomElevatedButton(
                  height: 56.v,
                  text: "Only this time",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleSmallRobotoOnPrimary,
                ),
                SizedBox(height: 4.v),
                CustomElevatedButton(
                  height: 56.v,
                  text: "Don’t allow",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleSmallRobotoOnPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
