import 'package:flutter/material.dart';

import '../../navigator/route_names.dart';
import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_checkbox.dart';
import '../../widgets/inputs/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: firstNameController, label: 'First Name'),
            const SizedBox(height: 16),
            CustomTextField(controller: lastNameController, label: 'Last Name'),
            const SizedBox(height: 16),
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(height: 16),
            CustomTextField(controller: passwordController, label: 'Password', obscureText: true),
            CustomCheckbox(
              value: acceptTerms,
              onChanged: (val) => setState(() => acceptTerms = val ?? false),
              label: "Accept terms and conditions",
            ),
            AppButton(
              text: "Sign Up",
              onPressed: () => Navigator.pushNamed(context, RouteNames.verify),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, RouteNames.login),
              child: const Text("Already have an account? Login"),
            )
          ],
        ),
      ),
    );
  }
}