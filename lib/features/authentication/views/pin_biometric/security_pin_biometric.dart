import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:daylio/features/authentication/controllers/pin_biometric/pin_bimetric_controller.dart';
import 'package:daylio/features/authentication/views/pin_biometric/widgets/pincode_area.dart';
import 'package:daylio/features/authentication/views/pin_biometric/widgets/pincode_button.dart';
import 'package:daylio/features/authentication/views/pin_biometric/widgets/pincode_header.dart';
import 'package:daylio/features/authentication/views/pin_biometric/widgets/pincode_icon.dart';
import 'package:daylio/navigation_menu.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SecurityPinBiometricScreen extends StatefulWidget {
  const SecurityPinBiometricScreen({super.key, required this.setPin});

  final bool setPin;

  @override
  State<SecurityPinBiometricScreen> createState() =>
      _SecurityPinBiometricScreenState();
}

class _SecurityPinBiometricScreenState extends State<SecurityPinBiometricScreen> {
  String enteredPin = '';
  bool isPinVisible = false;

  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
        _supportState = isSupported;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            const TPinCodeHeader(),
            const SizedBox(height: 50),

            /// pin code area
            TPinCodeArea(isPinVisible: isPinVisible, enteredPin: enteredPin),

            /// visiblity toggle button
            IconButton(
              onPressed: () {
                setState(() {
                  isPinVisible = !isPinVisible;
                });
              },
              icon: Icon(
                isPinVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            SizedBox(height: isPinVisible ? TSizes.securityPinHeight : TSizes.securityPinHeightSm),

            /// Digits 1 -> 9
            for (var i = 0; i < 3; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => numButton(1 + 3 * i + index),
                  ).toList(),
                ),
              ),

            /// Biometrics, 0 digit and back remove
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.securityPinHeightSm),
                    child: TextButton(
                      onPressed: _authenticate,
                      child: const TPinCodeIcon(number: 1),
                    ),
                  ),

                  numButton(0),

                  // Delete Button
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.securityPinHeightSm),
                    child: TextButton(
                      onPressed: () {
                        setState(
                          () {
                            if (enteredPin.isNotEmpty) {
                              enteredPin =
                                  enteredPin.substring(0, enteredPin.length - 1);
                            }
                          },
                        );
                      },
                      child: const TPinCodeIcon(number: 2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// reset button
            TextButton(
              onPressed: () {
                setState(() {
                  enteredPin = '';
                });
              },
              child: Text(
                TTexts.reset,
                style: TextStyle(
                  fontSize: TSizes.md,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  /// this widget will be use for each digit
  Widget numButton(int number) {
    final controller = Get.put(SecurityPinBiometricController());
    return Padding(
      padding: const EdgeInsets.only(top: TSizes.securityPinHeightSm),
      child: TextButton(
          onPressed: () {
            setState(() {
              if (enteredPin.length < 4) {
                enteredPin += number.toString();
              }
              if (enteredPin.length == 4) {
                // enteredPin += number.toString();
                if(widget.setPin){
                  controller.setPin(enteredPin);
                }else{
                  controller.verifyPin(enteredPin);
                }
              }
            });
          },
          child: TPinCodeButton(number: number)),
    );
  }

  // This is the widget for the biometric authentication
  Future<void> _authenticate() async {
    if(widget.setPin){
      return;
    }else {
      try {
        bool authenticated = await auth.authenticate(
          localizedReason: TTexts.biometricAuthSubTitle,
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        if (authenticated) {
          Get.offAll(() => const NavigationMenu(),
              transition: Transition.rightToLeft);
        }
        // print("Authenticated : $authenticated");
      } on PlatformException catch (e) {
        // print(e);
      }

      if (!mounted) {
        return;
      }
    }
    // we can call setState here
  }
}
