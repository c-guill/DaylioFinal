import 'package:daylio/utils/constants/image_strings.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.spaceOnBoarding),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.7,
            image: AssetImage(THelperFunctions.isDarkMode(context) ? TImages.darkAppLogo : TImages.lightAppLogo),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Image(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.47,
            image: AssetImage(image),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.left),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(subTitle, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}