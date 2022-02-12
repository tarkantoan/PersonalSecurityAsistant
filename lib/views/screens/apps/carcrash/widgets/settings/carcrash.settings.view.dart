import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.controller.dart';

class CarCrashSettings extends SFW {
  CarCrashSettings({Key? key, required controller})
      : super(key: key, controller: controller);

  CarCrashController get getController => controller as CarCrashController;

  @override
  initState() {}

  @override
  Widget build() {
    return Text("Ayarlar");
  }

  @override
  isBuilded() {}
}
