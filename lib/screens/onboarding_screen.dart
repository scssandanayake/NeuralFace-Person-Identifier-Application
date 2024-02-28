import 'package:flutter/material.dart';
import 'package:neural_face/screens/home_screen.dart';
import 'package:neural_face/screens/onboardingPages/onboard_page1.dart';
import 'package:neural_face/screens/onboardingPages/onboard_page2.dart';
import 'package:neural_face/screens/onboardingPages/onboard_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  // Keep track of if we are on the last page or not
  bool onLastPage = false;

  storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            OnBoardingScreen1(),
            OnBoardingScreen2(),
            OnBoardingScreen3(),
          ],
        ),

        // dot indicator
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip button
                GestureDetector(
                  onTap: () async {
                    _controller.jumpToPage(2);
                    await storeOnBoardInfo();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Text('skip'),
                ),

                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or done button
                onLastPage
                    ? GestureDetector(
                        onTap: () async {
                          await storeOnBoardInfo();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ),
                          );
                        },
                        child: const Text('done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('next'),
                      ),
              ],
            )),
      ],
    ));
  }
}
