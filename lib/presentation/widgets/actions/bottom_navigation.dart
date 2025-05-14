import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconButton(icon: Icon(Icons.account_balance_wallet_outlined), onPressed: null),
            SizedBox(width: 48), // space for FAB
            IconButton(icon: Icon(Icons.receipt_long_outlined), onPressed: null),
          ],
        ),
      ),
    );
  }
}
