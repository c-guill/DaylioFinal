import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:daylio/common/widgets/login_signup/form_divider.dart';
import 'package:daylio/common/widgets/login_signup/social_buttons.dart';
import 'package:daylio/features/authentication/views/login/widgets/login_form.dart';
import 'package:daylio/features/authentication/views/login/widgets/login_header.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            // Logo, Title and Subtitle
            const TLoginHeader(),

            // Form
            TLoginForm(),

            // Divider
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Footer
            TSocialButtons()
          ]),
        ),
      ),
    );
  }
}
