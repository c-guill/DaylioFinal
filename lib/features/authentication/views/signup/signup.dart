import 'package:daylio/common/widgets/login_signup/form_divider.dart';
import 'package:daylio/common/widgets/login_signup/social_buttons.dart';
import 'package:daylio/features/authentication/views/signup/widgets/signup_form.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Title
            Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Form
            const TSignupForm(),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Divider
            TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Footer
            const TSocialButtons(),
          ]),
        ),
      ),
    );
  }
}
