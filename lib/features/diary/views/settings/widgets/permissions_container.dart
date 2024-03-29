import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PermissionsContainer extends StatelessWidget {
  const PermissionsContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final bool darkMode = THelperFunctions.isDarkMode(context);

    return ContainerCustom(
      height: 169,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            TTexts.permissions,
            style: TextStyle(
              fontSize: TSizes.fontSizeXs,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                TTexts.notifications,
                style: TextStyle(
                  fontSize: TSizes.fontSizeMd,
                ),
              ),
              Icon(
                Iconsax.notification,
                size: TSizes.iconMd,
                color: darkMode
                    ? TColors.iconPrimaryDark
                    : TColors.iconPrimaryLight,
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                TTexts.locationSettings,
                style: TextStyle(
                  fontSize: TSizes.fontSizeMd,
                ),
              ),
              Icon(
                Iconsax.location,
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
