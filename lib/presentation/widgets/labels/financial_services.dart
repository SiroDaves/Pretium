import 'package:flutter/material.dart';

import '../actions/service_icon.dart';

class FinancialServices extends StatelessWidget {
  const FinancialServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Financial Services", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Kenya", style: TextStyle(color: Colors.teal)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ServiceIcon(icon: Icons.send, label: "Send Money"),
                ServiceIcon(icon: Icons.shopping_cart, label: "Buy Goods"),
                ServiceIcon(icon: Icons.receipt, label: "Paybill"),
                ServiceIcon(icon: Icons.phone_android, label: "Airtime"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
