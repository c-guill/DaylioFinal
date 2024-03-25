import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TPinCodeArea extends StatelessWidget {
  const TPinCodeArea({
    super.key,
    required this.isPinVisible,
    required this.enteredPin,
  });

  final bool isPinVisible;
  final String enteredPin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (index) {
          return Container(
            margin: const EdgeInsets.all(6.0),
            width: isPinVisible ? TSizes.securityPinWidth : TSizes.securityPinWidthSm,
            height: isPinVisible ? TSizes.securityPinHeight : TSizes.securityPinHeightSm,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.securityPinRadius),
              color: index < enteredPin.length
                  ? isPinVisible
                  ? TColors.primary.withOpacity(0.5)
                  : TColors.primary
                  : TColors.primary.withOpacity(0.2),
            ),
            child: isPinVisible && index < enteredPin.length
                ? Center(
              child: Text(
                enteredPin[index],
                style: const TextStyle(
                  fontSize: TSizes.md,
                  color: TColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
                : null,
          );
        },
      ),
    );
  }
}