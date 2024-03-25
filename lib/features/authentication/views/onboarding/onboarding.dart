import 'package:daylio/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:daylio/features/authentication/views/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:daylio/features/authentication/views/onboarding/widgets/onboarding_next_button.dart';
import 'package:daylio/features/authentication/views/onboarding/widgets/onboarding_page.dart';
import 'package:daylio/utils/constants/image_strings.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    // Decide the status bar style based on the theme
    SystemUiOverlayStyle statusBarStyle = THelperFunctions.isDarkMode(context)
        ? SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent)
        : SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBarStyle,
        child: Scaffold(
          body: Stack(
            children: [
              // Horizontal Scrollable Pages
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                  OnBoardingPage(
                    image: TImages.onBoardingImage1,
                    title: TTexts.onBoardingTitle1,
                    subTitle: TTexts.onBoardingSubTitle1,
                  ),
                  OnBoardingPage(
                    image: TImages.onBoardingImage2,
                    title: TTexts.onBoardingTitle2,
                    subTitle: TTexts.onBoardingSubTitle2,
                  ),
                  OnBoardingPage(
                    image: TImages.onBoardingImage3,
                    title: TTexts.onBoardingTitle3,
                    subTitle: TTexts.onBoardingSubTitle3,
                  ),
                  OnBoardingPage(
                    image: TImages.onBoardingImage4,
                    title: TTexts.onBoardingTitle4,
                    subTitle: TTexts.onBoardingSubTitle4,
                  ),
                ],
              ),

              // Dot Navigation SmoothPageIndicator
              const OnBoardingDotNavigation(),

              // Circular Button
              const OnBoardingNextButton()
            ],
          ),
        ));
  }
}
