import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ContainerCustom extends StatefulWidget {
  final double height;
  final Widget? child;

  const ContainerCustom({super.key, required this.height, this.child});

  @override
  State<ContainerCustom> createState() => _ContainerCustomState();
}

class _ContainerCustomState extends State<ContainerCustom> {
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: darkMode ? TColors.black : TColors.white,
        // Background color
        boxShadow: [
          BoxShadow(
            color: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
            blurRadius: 8, // Soften the shadow
            spreadRadius: 2, // Extend the shadow
            offset: const Offset(0, 10), // Vertical offset
          ),
        ],
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.cardPadding),
        child: widget.child,
      ),
    );
  }
}
