import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;

  const TagChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: darkMode ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2), // Shadow color with some transparency
            spreadRadius: 0, // The size of the shadow
            blurRadius: 4, // The blur radius of the shadow
            offset: const Offset(2, 2), // The position of the shadow on the x, y axis
          ),
        ],
      ),
      child: Chip(label: Text(text)),
    );
  }
}