import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TPinCodeHeader extends StatelessWidget {
  const TPinCodeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(TTexts.enterCodePin, style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: TSizes.sm),
          Text(TTexts.enterCodePinSubTitle, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
      // Subtitle
    );
  }
}
