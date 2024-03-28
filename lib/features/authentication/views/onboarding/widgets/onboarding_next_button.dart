import 'package:daylio/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/device/device_utility.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.spaceOnBoarding,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            backgroundColor: dark ? TColors.primary : TColors.dark,
            side: const BorderSide(color: TColors.dark),
            textStyle: const TextStyle(fontSize: TSizes.md, color: TColors.textWhite, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.onBoardingButtonRadius)),
          ).copyWith(
            minimumSize: MaterialStateProperty.all(Size(THelperFunctions.screenWidth() - TSizes.spaceOnBoarding*2 - TSizes.dotFullWidth, TSizes.onBoardingButtonHeight)),
          ),
          child: const Text('Next')),
    );
  }
}