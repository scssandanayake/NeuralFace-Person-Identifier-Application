import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

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
                        colors: [appTheme.teal200, appTheme.lime100])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgSaly44,
                              height: 260.v,
                              width: 320.h),
                          SizedBox(height: 5.v),
                          Container(
                              decoration: AppDecoration.outlineBlack,
                              child: Text("lbl_neuralface".tr,
                                  style: theme.textTheme.headlineSmall)),
                          SizedBox(height: 5.v)
                        ])))));
  }
}
