import 'package:flutter/material.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.view.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/widgets/eq.appbar.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/widgets/eq.appbar.view.dart';

class Earthquake {
  EarthquakeController earthquakeController = EarthquakeController();
  EQAppBarController eqAppBarController = EQAppBarController();

  Earthquake() {
    widget = Scaffold(
      appBar: EQAppBar(
        controller: eqAppBarController,
      ),
      body: EarthquakeScreen(controller: earthquakeController),
    );
  }

  late Widget widget;
}
