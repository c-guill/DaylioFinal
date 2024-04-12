import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String tags;
  final String image;

  const NoteCard({super.key, required this.title, required this.tags, required this.image});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity, // Takes the full width of the parent container, which is 150
              height: 150,
              decoration: BoxDecoration(
                color: darkMode ? TColors.black : TColors.white,
                boxShadow: [
                  BoxShadow(
                    color: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(tags, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}