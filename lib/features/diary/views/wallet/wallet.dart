import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 400),
            Center(child: Text('Wallet Screen')),
          ],
        ),
      ),
    );
  }
}
