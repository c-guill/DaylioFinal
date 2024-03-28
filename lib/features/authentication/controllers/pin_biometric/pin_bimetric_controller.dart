import 'package:daylio/common/widgets/basic_widget/toast.dart';
import 'package:daylio/navigation_menu.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shared_preferences/manage_data.dart';

class SecurityPinBiometricController extends GetxController {
  static SecurityPinBiometricController get instance => Get.find();
  final ManageData manageData = ManageData();

  // Variables
  void verifyPin(String enteredPin) async{
    String pinCode = await manageData.getCodePin();
    if (enteredPin.length == 4) {
      if (enteredPin.compareTo(pinCode) == 0) {
        Get.offAll(() => const NavigationMenu(), transition: Transition.rightToLeft);
      }else{
        showToast(message: "The Pin code isn't correct");
      }
    }
  }

  void setPin(String enteredPin) async{
    if (enteredPin.length == 4) {
      manageData.setCodePin(enteredPin);
      Get.offAll(() => const NavigationMenu(), transition: Transition.rightToLeft);
      showToast(message: "The Pin code has been set");
    }
  }
}
