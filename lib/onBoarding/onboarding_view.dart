import 'package:flutter/material.dart';
import 'package:travel_app/onBoarding/next_button.dart';
import 'package:travel_app/onBoarding/onboardingPage_widget.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // final List<Widget> _pages =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                OnboardingPage(
                  image: 'assets/image/onboarding1.jfif',
                  title: 'Welcome to Travel App',
                  description: 'Discover new places and adventures.',
                ),
                OnboardingPage(
                  image: 'assets/image/onboarding2.jfif',
                  title: 'Plan Your Trip',
                  description: 'Organize your trips with ease.',
                ),
                OnboardingPage(
                  image: 'assets/image/onboarding3.jfif',
                  title: 'Enjoy Your Journey',
                  description: 'Have a great time on your travels.',
                ),
              ],
            ),
          ),
          SizedBox(
              height:
                  16), // Add some space between the PageView and the indicators
          Expanded(flex: 0, child: buildPageIndicator(_currentPage, 3)),
          SizedBox(
              height:
                  16), // Add some space between the indicators and the NextButton
          NextButton(
            pageController: _pageController,
            currentPage: _currentPage,
            pageCount: 3,
          ),
        ],
      ),
    );
  }
}

Widget buildPageIndicator(int currentPage, int pageCount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      pageCount,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index
              ? Colors.grey
              : const Color.fromARGB(255, 34, 41, 47),
        ),
      ),
    ),
  );
}
