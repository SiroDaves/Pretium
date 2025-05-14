import 'package:flutter/material.dart';

import '../../navigator/route_names.dart';
import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_checkbox.dart';
import '../../widgets/inputs/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: !showPassword,
              suffixIcon: IconButton(
                icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => showPassword = !showPassword),
              ),
            ),
            CustomCheckbox(
              value: rememberMe,
              onChanged: (val) => setState(() => rememberMe = val ?? false),
              label: "Remember me",
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, RouteNames.password),
                child: const Text("Forgot password?"),
              ),
            ),
            AppButton(
                text: "Login",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home,
                    (route) => false,
                  );
                }),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, RouteNames.signup),
              child: const Text("Don't have an account? Signup"),
            )
          ],
        ),
      ),
    );
  }
}
