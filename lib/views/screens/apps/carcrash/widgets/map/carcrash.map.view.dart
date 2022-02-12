import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.controller.dart';

// ignore: must_be_immutable
class CarCrashMap extends SFW {
  CarCrashMap({Key? key, required controller, required this.module})
      : super(key: key, controller: controller);
  CarCrashController module;

  CarCrashMapController get getController =>
      controller as CarCrashMapController;
  Map<CircleId, Circle> circles = {
    CircleId("ss"): Circle(
      circleId: CircleId(
        "ss",
      ),
      fillColor: Colors.red.withOpacity(0.5),
      center: LatLng(41.335900, 36.253450),
      radius: 15,
      strokeWidth: 0,
      zIndex: 100,
    ),
  };

  @override
  initState() {}

  @override
  Widget build() {
    return Stack(
      children: [
        GoogleMap(
          trafficEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: getController.cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            getController.mapController = controller;
          },
          circles: Set<Circle>.of(circles.values),
        ),
        FloatingActionButton(
          child: Icon(
            getController.isCameraLock
                ? Icons.my_location_rounded
                : Icons.location_disabled,
            color: Colors.white,
          ),
          onPressed: () {
            getController.isCameraLock = !getController.isCameraLock;
          },
        ),
      ],
    );
  }

  @override
  isBuilded() {}
}
