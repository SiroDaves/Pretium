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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _acceptTerms = false, _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simplify your crypto payments with us',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _firstNameController,
              label: 'First Name',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _lastNameController,
              label: 'Last Name',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: !_showPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              ),
            ),
            const SizedBox(height: 10),
            CustomCheckbox(
              value: _acceptTerms,
              onChanged: (val) => setState(() => _acceptTerms = val ?? false),
              label: "Accept terms and conditions",
            ),
            const SizedBox(height: 10),
            AppButton(
              text: "Sign Up",
              onPressed: () => Navigator.pushNamed(context, RouteNames.verify),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                LinkButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.login,
                      (route) => false,
                    );
                  },
                  text: 'Login',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
