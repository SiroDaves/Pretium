import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(AppAssets.appIcon, height: 200, width: 200),
            const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  AppConstants.appTitle,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
                  speed: const Duration(milliseconds: 110),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 0),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            const Spacer(),
            const Text(
              '© Siro Daves',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
