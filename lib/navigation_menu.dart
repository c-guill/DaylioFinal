import 'package:daylio/features/diary/views/calendar/calendar.dart';
import 'package:daylio/features/diary/views/home/home.dart';
import 'package:daylio/features/diary/views/settings/settings.dart';
import 'package:daylio/features/diary/views/wallet/wallet.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: darkMode ? TColors.black : TColors.white,
            // Background color
            boxShadow: [
              BoxShadow(
                color: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                blurRadius: 8, // Soften the shadow
                spreadRadius: 2, // Extend the shadow
                offset: const Offset(0, -1), // Vertical offset
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: NavigationBar(
              height: 80,
              elevation: 0,
              // Set elevation to 0 as we have a custom shadow
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              backgroundColor: darkMode ? TColors.black : TColors.white,
              // Use transparent to show the Container color
              indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
              destinations: [
                NavigationDestination(
                  icon: Icon(Iconsax.home_2, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                  label: 'Home',
                  selectedIcon: const Icon(Iconsax.home_2, color: TColors.primary),
                ),
                // NavigationDestination(
                //   icon: Icon(Iconsax.graph, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                //   label: 'Stat',
                //   selectedIcon: const Icon(Iconsax.graph, color: TColors.primary),
                // ),
                NavigationDestination(
                  icon: Icon(Iconsax.calendar_1, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                  label: 'Calendar',
                  selectedIcon: const Icon(Iconsax.calendar_1, color: TColors.primary),
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.wallet_2, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                  label: 'Wallet',
                  selectedIcon: const Icon(Iconsax.wallet_2, color: TColors.primary),
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.setting_2, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                  label: 'Settings',
                  selectedIcon: const Icon(Iconsax.setting_2, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    // const StatScreen(),
    const CalendarScreen(),
    WalletScreen(),
    const SettingsScreen(),
  ];
}
