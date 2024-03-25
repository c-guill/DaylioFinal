import 'package:daylio/navigation_menu.dart';
import 'package:get/get.dart';

class SecurityPinBiometricController extends GetxController {
  static SecurityPinBiometricController get instance => Get.find();

  // Variables
  void verifyPin(String enteredPin) {
    if (enteredPin.length == 4) {
      if (enteredPin.compareTo("9999") == 0) {
        Get.offAll(() => const NavigationMenu(), transition: Transition.rightToLeft);
      }
    }
  }
}
