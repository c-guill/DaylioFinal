import 'package:daylio/features/diary/views/settings/widgets/account_container.dart';
import 'package:daylio/features/diary/views/settings/widgets/other_container.dart';
import 'package:daylio/features/diary/views/settings/widgets/permissions_container.dart';
import 'package:daylio/features/diary/views/settings/widgets/security_container.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return const Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingStyles.paddingWithAppBarHeight,
                child: Column(
                  children: [
                    // Account
                    AccountContainer(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    // Permissions
                    PermissionsContainer(),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    // Security
                    SecurityContainer(),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    // Other
                    OtherContainer(),
                  ],
                ))));
  }
}
