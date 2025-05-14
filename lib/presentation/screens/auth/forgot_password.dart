import 'package:flutter/material.dart';

import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your email to receive a password reset code',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 16),
            AppButton(text: "Send Reset Code", onPressed: () {})
          ],
        ),
      ),
    );
  }
}