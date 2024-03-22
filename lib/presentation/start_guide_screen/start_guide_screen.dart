import 'package:person_identifier_application/presentation/home_screen_temporary_container_screen/home_screen_temporary_page.dart';
//import 'package:person_identifier_application/presentation/scan_history_screen_page/scan_history_screen_page.dart';
import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:person_identifier_application/widgets/custom_bottom_app_bar.dart';
import 'package:person_identifier_application/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class StartGuideScreen extends StatelessWidget {
  StartGuideScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 5.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(5.h),
                  decoration: AppDecoration.fillTeal.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder17,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: EdgeInsets.fromLTRB(10.h, 4.v, 2.h, 4.v),
                        child: Text(
                          "Mr.Naveen",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: Text(
                  "Quick Start Guide",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 30.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 288.h,
                  margin: EdgeInsets.only(
                    left: 15.h,
                    right: 16.h,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the same industry's standard dummy text ever since the 1500s.!\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the same industry's standard dummy text ever since the 1500s.!\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the same industry's standard dummy text ever since the 1500s.!\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the same industry's standard dummy text ever since the 1500s.!",
                    maxLines: 19,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 1.71,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildSixtyOne(context),
        floatingActionButton: CustomFloatingButton(
          height: 50,
          width: 50,
          backgroundColor: appTheme.teal600,
          /*decoration: FloatingButtonStyleHelper.fillTeal,*/
          child: CustomImageView(
            imagePath: ImageConstant.imgCamera,
            height: 25.0.v,
            width: 25.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  /// Section Widget
  Widget _buildSixtyOne(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenTemporaryPage;
      case BottomBarEnum.History:
        //return AppRoutes.scanHistoryScreenPage;
      case BottomBarEnum.Tools:
        return "/";
      case BottomBarEnum.User:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenTemporaryPage:
        return HomeScreenTemporaryPage();
      //case AppRoutes.scanHistoryScreenPage:
        //return ScanHistoryScreenPage();
      default:
        return DefaultWidget();
    }
  }
}