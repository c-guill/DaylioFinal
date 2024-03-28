import 'package:daylio/features/authentication/views/onboarding/onboarding.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'common/widgets/shared_preferences/manage_data.dart';
import 'features/authentication/views/pin_biometric/security_pin_biometric.dart';

class App extends StatelessWidget {
  const App({super.key, required this.UID});

  final String UID;
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      builder: (context, child) {
        // This ensures that the textScaleFactor is always 1.0, no matter the system settings
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: FutureBuilder(
        future: preloadImages(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Remove the native splash screen now that our initialization is complete
            FlutterNativeSplash.remove();

            // Once images are loaded, show the right screen
            return UID == "" ? const OnBoardingScreen() : const SecurityPinBiometricScreen();
          } else if (snapshot.hasError) {
            // Ideally handle initialization errors here
            FlutterNativeSplash.remove(); // Ensure splash screen is removed even on error
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // While waiting for the initialization to complete, keep showing the native splash
          // This widget won't actually be seen since the native splash is preserved
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> preloadImages(BuildContext context) async {
    // Preload somme images here:
    await precacheImage(const AssetImage('assets/images/on_boarding_images/Diary-amico.png'), context);
    await precacheImage(const AssetImage('assets/images/on_boarding_images/Fingerprint-bro.png'), context);
    await precacheImage(const AssetImage('assets/images/on_boarding_images/Investment-data-amico.png'), context);
    await precacheImage(const AssetImage('assets/images/on_boarding_images/Search-Diary.png'), context);
  }
}