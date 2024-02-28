import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neural_face/screens/home_screen.dart';
import '../main.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive); // get rid of top and bottom bar

    Future.delayed(const Duration(seconds: 2), () {
      // after 2 seconds of the splash screen redirect to the home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => isViewed !=0 ? const OnBoardingScreen(): const HomeScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to get the top and bottom again
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellow.shade100],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/img.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Neural Face",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 3,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}