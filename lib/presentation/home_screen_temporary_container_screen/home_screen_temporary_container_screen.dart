import 'package:person_identifier_application/presentation/home_screen_temporary_container_screen/home_screen_temporary_page.dart';
//import 'package:person_identifier_application/presentation/scan_history_screen_page/scan_history_screen_page.dart';
import 'package:person_identifier_application/widgets/custom_bottom_app_bar.dart';
import 'package:person_identifier_application/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeScreenTemporaryContainerScreen extends StatelessWidget {
  HomeScreenTemporaryContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeScreenTemporaryPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildSixtyTwo(context),
            floatingActionButton: CustomFloatingButton(
                height: 50,
                width: 50,
                backgroundColor: appTheme.teal600,
                /*decoration: FloatingButtonStyleHelper.fillTeal,*/
                child: CustomImageView(
                    imagePath: ImageConstant.imgCamera,
                    height: 25.0.v,
                    width: 25.0.h)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
  Widget _buildSixtyTwo(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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
