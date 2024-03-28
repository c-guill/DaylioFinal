import 'package:daylio/features/authentication/views/signup/verify_email.dart';
import 'package:daylio/features/authentication/views/signup/widgets/terms_conditions_checkbox.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/basic_widget/toast.dart';
import '../../../../../common/widgets/shared_preferences/manage_data.dart';
import '../../../controllers/firebase_auth_services.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({
    super.key,
  });

  @override
  State<TSignupForm> createState() => _TSignupForm();

}

class _TSignupForm extends State<TSignupForm> {
  bool _isSigning = false;
  bool _passwordHidden = true;
  bool _checkPasswordHidden = true;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final ManageData manageData = ManageData();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordVerificationController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordVerificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Mail
          TextFormField(
            controller: _emailController,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: _passwordController,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(onPressed: _changeVisibilityPassword,
                  icon: _passwordHidden ? Icon(Iconsax.eye) : Icon(
                      Iconsax.eye_slash)),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // ConfirmPassword
          TextFormField(
            controller: _passwordVerificationController,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(onPressed: _changeVisibilitycheckPassword,
                  icon: _checkPasswordHidden ? Icon(Iconsax.eye) : Icon(
                      Iconsax.eye_slash)),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Terms and Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: _signUp,
                child: _isSigning ? CircularProgressIndicator(color: Colors.white,) : const Text(TTexts.createAccount)),
          ),
        ],
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

  void _changeVisibilitycheckPassword() {
    setState(() {
      if (_checkPasswordHidden) {
        _checkPasswordHidden = false;
      } else {
        _checkPasswordHidden = true;
      }
    });
  }

  void _signUp() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordVerification = _passwordVerificationController.text;

    try {
      if (password.compareTo(passwordVerification) == 0) {
        User? user = await _auth.signUpWithEmailAndPassword(email, password);
        if(user != null) {
          Get.to(() => const VerifyEmailScreen());
          manageData.setUID(user);
        }
      }else {
        showToast(message: "Those passwords didn’t match. Try again.");

      }
    } on FirebaseAuthException catch (e) {
      showToast(message: _auth.getMessageError(e.code));
    }

    setState(() {
      _isSigning = false;
    });
  }

}

