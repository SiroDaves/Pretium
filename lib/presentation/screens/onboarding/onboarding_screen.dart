import 'package:flutter/material.dart';

import '../../../data/models/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          _buildSkipButton(),
          _buildIndicator(),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index) => setState(() => _currentIndex = index),
      itemCount: onboardingPages.length,
      itemBuilder: (context, index) => _buildPageContent(onboardingPages[index]),
    );
  }

  Widget _buildPageContent(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.teal.shade100,
            child: Text(page.icon, style: const TextStyle(fontSize: 36)),
          ),
          const SizedBox(height: 24),
          Text(
            page.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Positioned(
      top: 40,
      right: 20,
      child: TextButton(
        onPressed: () {
          // TODO: Handle skip logic
        },
        child: const Text("Skip", style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onboardingPages.length, (index) {
          final isActive = _currentIndex == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? Colors.teal : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomButton() {
    final isLastPage = _currentIndex == onboardingPages.length - 1;
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (isLastPage) {
            // TODO: Handle "Get Started"
          } else {
            _controller.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(isLastPage ? "Get Started" : "Next"),
      ),
    );
  }
}
