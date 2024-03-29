import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/authentication/views/pin_biometric/security_pin_biometric.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecurityContainer extends StatelessWidget {
  const SecurityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = THelperFunctions.isDarkMode(context);

    return ContainerCustom(
      height: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            TTexts.security,
            style: TextStyle(
              fontSize: TSizes.fontSizeXs,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                TTexts.faceLock,
                style: TextStyle(
                  fontSize: TSizes.fontSizeMd,
                ),
              ),
              Icon(
                Iconsax.security,
                size: TSizes.iconMd,
                color: darkMode
                    ? TColors.iconPrimaryDark
                    : TColors.iconPrimaryLight,
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          GestureDetector(
            onTap: () {
              Get.to(() => const SecurityPinBiometricScreen(setPin: true,),
                  transition: Transition.downToUp);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SecurityPinBiometricScreen(setPin: true,),
                          transition: Transition.downToUp);
                    },
                    child: const Text(
                      TTexts.securityPin,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Iconsax.lock_circle,
                  size: TSizes.iconMd,
                  color: darkMode
                      ? TColors.iconPrimaryDark
                      : TColors.iconPrimaryLight,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                TTexts.intruderSelfie,
                style: TextStyle(
                  fontSize: TSizes.fontSizeMd,
                ),
              ),
              Icon(
                Iconsax.camera_slash,
                size: TSizes.iconMd,
                color: darkMode
                    ? TColors.iconPrimaryDark
                    : TColors.iconPrimaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}