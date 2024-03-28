import 'package:daylio/common/widgets/basic_widget/toast.dart';
import 'package:daylio/features/authentication/views/password_configuration/forget_password.dart';
import 'package:daylio/features/authentication/views/signup/signup.dart';
import 'package:daylio/features/authentication/views/pin_biometric/security_pin_biometric.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _signIn, child: _isSigning ? CircularProgressIndicator(color: Colors.white,) : const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account Text
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))),

          ],
        ),
      ),
    );
  }

  void _changeVisibilityPassword() {
    setState(() {
      if (_passwordHidden) {
        _passwordHidden = false;
      } else {
        _passwordHidden = true;
      }
    });
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    try{
      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if(user != null) {
        if(user.emailVerified){
          Get.to(() => const SecurityPinBiometricScreen(setPin: true,),
              transition: Transition.downToUp);
          showToast(message: TTexts.sucessfullogin);
          manageData.setUID(user);
        }else {
          showToast(message: "Your email address isn't verified, check your mailbox");
          await user.sendEmailVerification();
        }
      }
    } on FirebaseAuthException catch(e){
      showToast(message: _auth.getMessageError(e.code));
    }

    setState(() {
      _isSigning = false;
    });

  }

}