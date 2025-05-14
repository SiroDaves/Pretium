import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF004D40),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
          SizedBox(height: 10),
          Text("Wallet Balance", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5),
          Text("KES 0.00", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          Text("\$ 0.00", style: TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}
