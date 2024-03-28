import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart'; 
import 'firebase_options.dart';

/// ------ Entry point of Flutter App ------
Future<void> main() async {
  // Todo: Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //     (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Todo: Initialize Authentication

  runApp(const App());
}
