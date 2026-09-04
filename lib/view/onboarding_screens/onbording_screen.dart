import 'package:career_lk/view/login/signup_screen.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onbarding 1.jpg",
      "description": "Discover thousands of opportunities that match your skills and career goals.",
      "subtitle": "Find Jobs That Fit You",
      "title": "Find Your\nDream Job",
    },
    {
      "image": "assets/images/onbarding 2.png",
      "description": "Get personalized job recommendations based on your skills and interests.",
      "subtitle": "Jobs Made For You",
      "title": "Your Perfect\nMatch",
    },
    {
      "image": "assets/images/onbarding 3.png",
      "description": "Connect with great companies and take the next step toward your future.",
      "subtitle": "Take The Next Step",
      "title": "Build Your\nFuture",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = onboardingData[index];

              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(data["image"]!, fit: BoxFit.cover),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xDD07131A),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.6),

                  Text(
                    onboardingData[currentPage]["description"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    onboardingData[currentPage]["subtitle"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    onboardingData[currentPage]["title"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w400,
                      height: 0.95,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Bottom controls
                  Row(
                    children: [
                      // Page indicators
                      Row(
                        children: List.generate(onboardingData.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 7),
                            width: currentPage == index ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? Colors.white
                                  : Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),

                      const Spacer(),

                      // Button
                      GestureDetector(
                        onTap: () {
                          if (currentPage < onboardingData.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              currentPage == onboardingData.length - 1
                                  ? "GET STARTED"
                                  : "NEXT",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: currentPage == 2
                                      ? Color(0xff1a96fa)
                                      : Colors.white70,
                                  width: currentPage == 2 ? 4 : 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
