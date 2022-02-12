import 'package:flutter/material.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/appbar/carcrash.appbar.view.dart';

class CarCrash {
  CarCrashController carcrashController = CarCrashController();

  CarCrash() {
    widget = Scaffold(
      appBar: CarCrashAppBar(
        controller: carcrashController,
      ),
      body: CarCrashScreen(controller: carcrashController),
    );
  }

  late Widget widget;
}
