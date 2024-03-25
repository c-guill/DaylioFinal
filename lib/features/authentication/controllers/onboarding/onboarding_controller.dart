import 'package:daylio/features/authentication/views/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index & Jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 3) {
      Get.offAll(const LoginScreen(), transition: Transition.zoom);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index & Jump to the last page
  void skipPage() {
    currentPageIndex.value = 3;
    pageController.jumpToPage(3);
  }
}