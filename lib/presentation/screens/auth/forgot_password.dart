import 'package:flutter/material.dart';

import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(height: 16),
            AppButton(text: "Send Reset Code", onPressed: () {})
          ],
        ),
      ),
    );
  }
}