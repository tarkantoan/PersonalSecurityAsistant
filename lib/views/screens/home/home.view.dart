import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.dart';
import 'package:personal_security_asistant/views/screens/home/home.controller.dart';

class HomeScreen extends SFW {
  HomeScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  HomeController get getController => controller as HomeController;

  @override
  Function get isBuildedCallbackFunction => () {};

  Earthquake earthquake = Earthquake();
  CarCrash carCrash = CarCrash();

  @override
  Widget build() {
    return carCrash.widget;
  }

  @override
  initState() {}

  @override
  isBuilded() {}
}
