import 'package:daylio/features/authentication/views/password_configuration/forget_password.dart';
import 'package:daylio/features/authentication/views/signup/signup.dart';
import 'package:daylio/features/authentication/views/pin_biometric/security_pin_biometric.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/shared_preferences/manage_data.dart';
import '../../../controllers/firebase_auth_services.dart';

class TLoginForm extends StatefulWidget {
  TLoginForm({
    super.key,
  });


  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  bool _isSigning = false;
  bool _passwordHidden = true;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final ManageData manageData = ManageData();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(PasswordController());

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: _passwordHidden,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(onPressed: _changeVisibilityPassword, icon: _passwordHidden ? Icon(Iconsax.eye) : Icon(Iconsax.eye_slash)),
              ),

            ),
            Obx(() => TextFormField(
              obscureText: !passwordController.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: 'Password', // Replace with your label text variable
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordController.isPasswordVisible.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: passwordController.togglePasswordVisibility,
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