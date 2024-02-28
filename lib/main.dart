import 'package:flutter/material.dart';
import 'package:neural_face/screens/home_screen.dart';
import 'package:neural_face/screens/onboarding_screen.dart';
import 'package:neural_face/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: OnBoardingScreenSplashScreen(),
    );
  }
}