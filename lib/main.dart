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
  runApp(MaterialApp(home: app.widget));
}
