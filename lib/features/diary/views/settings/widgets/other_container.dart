import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/common/widgets/shared_preferences/manage_data.dart';
import 'package:daylio/features/authentication/views/login/login.dart';
import 'package:daylio/features/diary/views/settings/other/help.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OtherContainer extends StatelessWidget {
  const OtherContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = THelperFunctions.isDarkMode(context);
    final ManageData manageData = ManageData();

    return ContainerCustom(
      height: 169,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            TTexts.other,
            style: TextStyle(
              fontSize: TSizes.fontSizeXs,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          GestureDetector(
            onTap: () {
              // Add your help functionality here
              // For example, you can open a dialog or navigate to a help screen
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const HelpPage(),
                          transition: Transition.rightToLeft);
                    },
                    child: const Text(
                      TTexts.help,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Iconsax.info_circle,
                  size: TSizes.iconMd,
                  color: darkMode
                      ? TColors.iconPrimaryDark
                      : TColors.iconPrimaryLight,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout Confirmation'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          manageData.removeUID();
                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => const LoginScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout Confirmation'),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  manageData.removeUID();
                                  FirebaseAuth.instance.signOut();
                                  Get.offAll(() => const LoginScreen(),
                                      transition: Transition.rightToLeft);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      TTexts.logout,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Iconsax.logout,
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
