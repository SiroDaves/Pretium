import 'package:flutter/material.dart';

import '../../navigator/route_names.dart';
import '../../widgets/actions/app_button.dart';
import '../../widgets/inputs/custom_text_field.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final codeController = TextEditingController();
  String selectedCountry = "Global";

  void _selectCountry() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return ListView(
          children: ["Kenya", "Uganda", "Nigeria", "Global"]
              .map((country) => ListTile(
                    title: Text(country),
                    onTap: () => Navigator.pop(context, country),
                  ))
              .toList(),
        );
      },
    );
    if (result != null) {
      setState(() => selectedCountry = result);
    }
  }

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
              'Verify Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the verification code sent to your email',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _selectCountry,
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Select Country",
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    hintText: selectedCountry,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
                controller: codeController, label: 'Verification Code'),
            const SizedBox(height: 16),
            AppButton(
                text: "Verify Account",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home,
                    (route) => false,
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive the code?"),
                LinkButton(
                  onPressed: () {},
                  text: 'Resend Code',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
