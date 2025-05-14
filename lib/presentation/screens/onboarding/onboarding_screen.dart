import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/di/injectable.dart';
import '../../../core/utils/constants/pref_constants.dart';
import '../../../data/models/onboarding_page.dart';
import '../../../domain/auth_repository.dart';
import '../../../domain/prefs_repository.dart';
import '../../navigator/route_names.dart';
import '../../widgets/actions/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final _authRepo = AuthRepository();
  final _prefsrepo = getIt<PrefsRepository>();

  void nextPage() {
    _prefsrepo.setPrefBool(PrefConstants.isOnboardedKey, true);
    final isAuthenticated = _authRepo.status == AuthStatus.authenticated;

    Navigator.pushNamedAndRemoveUntil(
      context,
      isAuthenticated ? RouteNames.home : RouteNames.login,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_buildSkipButton()],
                ).padding(right: 20, top: 8),
                const Spacer(),
                _buildIndicator(),
                const SizedBox(height: 16),
                _buildBottomButton().padding(horizontal: 16),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index) => setState(() => _currentIndex = index),
      itemCount: onboardingPages.length,
      itemBuilder: (context, index) =>
          _buildPageContent(onboardingPages[index]),
    );
  }

  Widget _buildPageContent(OnboardingPage page) {
    return Column(
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
    ).padding(horizontal: 24.0);
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: () => nextPage(),
      child: const Text("Skip", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildIndicator() {
    return Row(
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
    );
  }

  Widget _buildBottomButton() {
    final isLastPage = _currentIndex == onboardingPages.length - 1;
    return AppButton(
      text: isLastPage ? "Get Started" : "Next",
      onPressed: () {
        if (isLastPage) {
          nextPage();
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
