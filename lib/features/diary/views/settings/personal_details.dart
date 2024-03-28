import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.personalDetails),
      ),
      body: const Center(
        child: Text('This is the Personal Data Page'),
      ),
    );
  }
}
