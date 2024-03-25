import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 400),
            Center(child: Text('Settings Screen')),
          ],
        ),
      ),
    );
  }
}
