import 'package:flutter/material.dart';

import '../../widgets/actions/bottom_navigation.dart';
import '../../widgets/labels/financial_services.dart';
import '../../widgets/labels/wallet_card.dart';
import 'recent_transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Wrap(
          children: const [
            ListTile(leading: Icon(Icons.send), title: Text("Send Money")),
            ListTile(leading: Icon(Icons.shopping_cart), title: Text("Buy Goods")),
            ListTile(leading: Icon(Icons.receipt), title: Text("Paybill")),
            ListTile(leading: Icon(Icons.phone_android), title: Text("Airtime")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(child: Text("S")),
              SizedBox(width: 12),
              Text("Hello, Siro Daves 👋", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          WalletCard(),
          SizedBox(height: 16),
          FinancialServices(),
          SizedBox(height: 24),
          RecentTransactions(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openBottomSheet(context),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.qr_code),
      ),
    );
  }
}
