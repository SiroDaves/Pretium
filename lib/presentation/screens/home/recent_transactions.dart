import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Recent transactions", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("See all", style: TextStyle(color: Colors.teal)),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 200, height: 12, color: Colors.grey.shade300),
                      const SizedBox(height: 4),
                      Container(width: 100, height: 10, color: Colors.grey.shade300),
                    ],
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
