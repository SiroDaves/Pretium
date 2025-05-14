import 'package:flutter/material.dart';

import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_checkbox.dart';
import '../../widgets/inputs/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false, _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.wallet,
                  size: 50,
                  color: ThemeColors.primary,
                ),
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue',
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
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: !_showPassword,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () =>
                      setState(() => _showPassword = !_showPassword),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCheckbox(
                    value: _rememberMe,
                    onChanged: (val) =>
                        setState(() => _rememberMe = val ?? false),
                    label: "Remember me",
                  ),
                  LinkButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteNames.password),
                    text: 'Forgot Password?',
                  )
                ],
              ),
              const SizedBox(height: 15),
              AppButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.home,
                      (route) => false,
                    );
                  }),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  LinkButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteNames.signup),
                    text: 'Sign Up',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
