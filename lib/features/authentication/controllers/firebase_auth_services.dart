import 'package:daylio/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException {
      rethrow;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException {
      rethrow;
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    }on FirebaseAuthException {
      rethrow;
    }
  }

  String getMessageError(String code){
    switch(code){
      case 'user-not-found':
        return TTexts.usernotfound;
      case 'wrong-password':
        return TTexts.wrongpassword;
      case 'invalid-credential':
        return TTexts.invalidcredential;
      case 'channel-error':
        return TTexts.emptyinformation;
      default:
        return code;
    }
  }

}