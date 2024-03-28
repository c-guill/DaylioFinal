import 'package:daylio/features/diary/views/home/widgets/home_appbar.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            THomeAppBar(darkMode: darkMode),
          ],
        ),
      ),
    );
  }
}
