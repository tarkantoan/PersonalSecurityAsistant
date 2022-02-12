import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/config/firebase_options.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/app.class.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  General.prefs = await SharedPreferences.getInstance();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final app = App();
  runApp(MaterialApp(
    theme: customThemeData,
    home: app.widget,
  ));
}

ThemeData customThemeData = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: const MaterialColor(
    0xff4438ca,
    <int, Color>{
      50: Color(0xffece7f9), //10%
      100: Color(0xffcec5f0), //20%
      200: Color(0xffad9ee7), //30%
      300: Color(0xff8b76df), //40%
      400: Color(0xff6f59d8), //50%
      500: Color(0xff503dd0), //60%
      600: Color(0xff4438ca), //70%
      700: Color(0xff3130c1), //80%
      800: Color(0xff172bba), //90%
      900: Color(0xff001fae), //100%
    },
  ),
);
