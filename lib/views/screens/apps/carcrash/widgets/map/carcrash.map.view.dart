import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.controller.dart';

class CarCrashMap extends SFW {
  CarCrashMap({Key? key, required controller})
      : super(key: key, controller: controller);

  CarCrashController get getController => controller as CarCrashController;

  @override
  initState() {}

  @override
  Widget build() {
    return GoogleMap(
      trafficEnabled: true,
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: getController.cameraPosition,
      onMapCreated: (GoogleMapController controller) {},
    );
  }

  @override
  isBuilded() {}
}
