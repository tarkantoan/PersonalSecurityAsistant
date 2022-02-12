import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/appbar/carcrash.appbar.view.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/bottom_nav/carcrash.bottomnav.view.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.view.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/settings/carcrash.settings.view.dart';

class CarCrashScreen extends SFW {
  CarCrashScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  CarCrashController get getController => controller as CarCrashController;
  CarCrashMapController carCrashMapController = CarCrashMapController();
  @override
  initState() {}
  int selectedIndex = 1;

  @override
  Widget build() {
    return Scaffold(
      appBar: CarCrashAppBar(
        controller: SFWController(),
        module: getController,
      ),
      body: selectPages(selectedIndex),
      bottomNavigationBar: CarCrashBottomNav(
        controller: SFWController(),
        module: getController,
      ),
    );
  }

  Widget selectPages(int index) {
    switch (index) {
      case 1:
        return CarCrashSettings(controller: SFWController());
      default:
        return CarCrashMap(
          controller: carCrashMapController,
          module: getController,
        );
    }
  }

  @override
  isBuilded() {}
}
