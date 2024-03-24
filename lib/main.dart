import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:person_identifier_application/presentation/app_navigation_screen/onboard_screen.dart';
import 'package:person_identifier_application/presentation/home_screen_temporary_container_screen/home_screen_temporary_container_screen.dart';
import 'package:person_identifier_application/presentation/home_screen_temporary_container_screen/home_screen_temporary_page.dart';
import 'package:person_identifier_application/presentation/main_login_sign_up_screen/main_login_sign_up_screen.dart';
import 'package:person_identifier_application/presentation/main_login_sign_up_screen/main_login_sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';
import 'firebase_options.dart';

int? isViewed;
late List<CameraDescription> camera;

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  camera = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);*/

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(

          theme: theme,
          title: 'person_identifier_application',
          debugShowCheckedModeBanner: false,
          /*initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,*/
          home: OnBoardingScreen(),
        );
      },
    );
  }
}
