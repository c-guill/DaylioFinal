import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/views/settings/controllers/theme_mode_selection.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/enums.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../account/personal_details.dart';

class AccountContainer extends StatefulWidget {
  const AccountContainer({Key? key});

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ContainerCustom(
      height: 169,
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
              Get.to(const PersonalDataPage(), transition: Transition.rightToLeft);
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
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.iconPrimaryDark
                      : TColors.iconPrimaryLight,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox( // Added SizedBox to ensure consistent height
            height: 24, // Adjust height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                    const SizedBox(
                        width: TSizes
                            .spaceBtwItems), // Add space between text and dropdown
                    Obx(() => DropdownButton<ThemeModeSelection>(
                      value: _themeController.selectedThemeMode.value,
                      onChanged: (value) {
                        setState(() {
                          _themeController.updateThemeMode(value!);
                        });
                      },
                      underline: Container(),
                      items: const [
                        DropdownMenuItem(
                          value: ThemeModeSelection.system,
                          child: Text('System'),
                        ),
                        DropdownMenuItem(
                          value: ThemeModeSelection.light,
                          child: Text('Light'),
                        ),
                        DropdownMenuItem(
                          value: ThemeModeSelection.dark,
                          child: Text('Dark'),
                        ),
                      ],
                    )),

                  ],
                ),
                const Icon(
                  Iconsax.brush_1, // Choose the appropriate icon
                  size: 24, // Adjust icon size as needed
                  color: Colors.grey, // Adjust icon color as needed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}