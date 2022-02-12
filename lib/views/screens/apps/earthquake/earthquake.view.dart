import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.controller.dart';

class EarthquakeScreen extends SFW {
  EarthquakeScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  EarthquakeController get getController => controller as EarthquakeController;

  @override
  initState() {}

  @override
  Widget build() {
    return Text("Deprem");
  }

  @override
  isBuilded() {
    state.setState(() {
      controller.width = MediaQuery.of(state.context).size.width;
      controller.height = MediaQuery.of(state.context).size.height;
    });
  }
}
