import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../account/personal_details.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = THelperFunctions.isDarkMode(context);

    return ContainerCustom(
      height: 113,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            TTexts.account,
            style: TextStyle(
              fontSize: TSizes.fontSizeXs,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalDataPage()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    TTexts.personalDetails,
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd,
                    ),
                  ),
                ),
                Icon(
                  Iconsax.user,
                  size: TSizes.iconMd,
                  color: darkMode
                      ? TColors.iconPrimaryDark
                      : TColors.iconPrimaryLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
