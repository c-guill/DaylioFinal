import 'package:daylio/features/authentication/controllers/login/password_controller.dart';
import 'package:daylio/features/authentication/views/password_configuration/forget_password.dart';
import 'package:daylio/features/authentication/views/signup/signup.dart';
import 'package:daylio/features/authentication/views/pin_biometric/security_pin_biometric.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PasswordController controller = Get.put(PasswordController());

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            Obx(() => TextFormField(
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: 'Password', // Replace with your label text variable
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            )),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                // Forgot Password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace),

            // Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const SecurityPinBiometricScreen(), transition: Transition.downToUp), child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account Text
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(TTexts.signupDontHaveAccount),
                TextButton(
                  onPressed: () {},
                  child: const Text(TTexts.signUp, style: TextStyle(decoration: TextDecoration.underline, fontSize: TSizes.fontSizeSm))),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}