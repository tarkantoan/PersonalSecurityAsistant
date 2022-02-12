import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.dart';
import 'package:personal_security_asistant/views/screens/home/home.controller.dart';

class HomeScreen extends SFW {
  HomeScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  HomeController get getController => controller as HomeController;

  @override
  Function get isBuildedCallbackFunction => () {};

  Earthquake earthquake = Earthquake();

  @override
  Widget build() {
    CarCrashController carCrashController = CarCrashController();
    return CarCrashScreen(controller: carCrashController);
  }

  @override
  initState() {}

  @override
  isBuilded() {}
}
