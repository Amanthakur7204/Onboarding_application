import 'package:flutter/material.dart';
import 'package:onboardingscreen_app/home.dart';
import 'package:onboardingscreen_app/onboarding/page1.dart';
import 'package:onboardingscreen_app/onboarding/page2.dart';
import 'package:onboardingscreen_app/onboarding/page3.dart';
import 'package:onboardingscreen_app/onboarding/page4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _pageController = PageController();
  bool onpagechange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Wallpaper"),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onpagechange = (index == 3);
              });
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(3);
                    },
                    child: Text("Skip")),
                SmoothPageIndicator(controller: _pageController, count: 4),
                onpagechange
                    ? GestureDetector(
                        onTap: () => {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Home())),
                        },
                        child: const Text("Done"),
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: const Text("Next"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
