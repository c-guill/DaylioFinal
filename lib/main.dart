import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/widgets/shared_preferences/manage_data.dart';
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

  // Load theme selection from ManageData
  final manageData = ManageData();
  final themeMode = await manageData.getThemeMode();

  // Initialize your app with the loaded theme
  runApp(App(initialThemeMode: themeMode));
}
