import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 400),
            Center(child: Text('Calendar Screen')),
          ],
        ),
      ),
    );
  }
}
