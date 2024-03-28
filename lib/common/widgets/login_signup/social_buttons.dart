import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/image_strings.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/views/pin_biometric/security_pin_biometric.dart';
import '../../../utils/constants/text_strings.dart';
import '../basic_widget/toast.dart';
import '../shared_preferences/manage_data.dart';

class TSocialButtons extends StatelessWidget {
  TSocialButtons({
    super.key,
  });

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ManageData manageData = ManageData();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: _signInWithGoogle,
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.google),
              )
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.facebook),
              )
          ),
        ),
      ],
    );
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try{

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential user = await _firebaseAuth.signInWithCredential(credential);
        if(user.user != null) {
          Get.to(() => const SecurityPinBiometricScreen(),
              transition: Transition.downToUp);
          showToast(message: TTexts.sucessfullogin);
          manageData.setUID(user.user!);
        }
      }

    }catch(e){
      showToast(message: "some error occured $e");

    }
  }
}