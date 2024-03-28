import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TPinCodeButton extends StatelessWidget {
  const TPinCodeButton({
    super.key, required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Container(
      width: TSizes.securityPinHeight + TSizes.securityPinHeightSm/2, // Set the width of the circle
      height: TSizes.securityPinHeight + TSizes.securityPinHeightSm/2, // Set the height of the circle
      decoration: BoxDecoration(
        color: darkMode ? TColors.black : TColors.white, // Set the color of the circle
        shape: BoxShape.circle, // Set the shape of the container to be a circle
        boxShadow: [
          BoxShadow(
            color: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(-1, 5), // Shadow position
          ),
        ],
      ),
      alignment: Alignment.center, // Center the text inside the circle
      child: Text(
        number.toString(), // The number to display
        style: TextStyle(
          fontSize: TSizes.lg, // Font size
          fontWeight: FontWeight.w600, // Font weight
          color: darkMode ? TColors.white : TColors.black, // Text color
        ),
      ),
    );
  }
}