import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen.dart';
import '../../theme/theme_helper.dart';
import '../main_login_sign_up_screen/main_login_sign_up_screen.dart';
import '../onboarding_screens_four_screen/onboarding_screens_four_screen.dart';
import '../onboarding_screens_one_screen/onboarding_screens_one_screen.dart';
import '../onboarding_screens_three_screen/onboarding_screens_three_screen.dart';
import '../onboarding_screens_two_screen/onboarding_screens_two_screen.dart';

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
                  onLastPage = (index == 3);
                });
              },
              children: const [
                OnboardingScreensOneScreen(),
                OnboardingScreensTwoScreen(),
                OnboardingScreensThreeScreen(),
                OnboardingScreensFourScreen(),
              ],
            ),

            // dot indicator
            Container(
                alignment: const Alignment(0, 0.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // skip button
                    GestureDetector(
                      onTap: () async {
                        _controller.jumpToPage(3);
                        await storeOnBoardInfo();
                        /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));*/
                      },
                      child: Text(
                          'skip',
                          style: theme.textTheme.titleMedium?.copyWith(color: Color(0xFF1F8A70)),
                      ),
                    ),

                    // dot indicator
                    SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: ScrollingDotsEffect(
                          spacing: 8,
                          activeDotColor: theme.colorScheme.primary,
                          dotColor: theme.colorScheme.primary.withOpacity(0.5),
                          dotHeight: 10.v,
                          dotWidth: 10.h,
                      ),
                    ),

                    // next or done button
                    onLastPage
                        ? GestureDetector(
                      onTap: () async {
                        await storeOnBoardInfo();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MainLoginSignUpScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                          'done',
                           style: theme.textTheme.titleMedium?.copyWith(color: Color(0xFF1F8A70)),
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                          'next',

                        style: theme.textTheme.titleMedium?.copyWith(color: Color(0xFF1F8A70)),

                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
