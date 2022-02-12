import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/model/carcrash.model.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/map/carcrash.map.controller.dart';

// ignore: must_be_immutable
class CarCrashMap extends SFW {
  CarCrashMap({Key? key, required controller, required this.module})
      : super(key: key, controller: controller);
  CarCrashController module;

  CarCrashMapController get getController =>
      controller as CarCrashMapController;

  Map<CircleId, Circle> circles = {};

  @override
  initState() {
    List<dynamic> list =
        (json.decode(CarCrashModel.demoData)['crashes']) as List<dynamic>;
    list.forEach((element) {
      final crash = (element as Map<String, dynamic>);
      final ll =
          LatLng((crash["latLng"] as List)[0], (crash["latLng"] as List)[1]);
      circles.addAll({
        CircleId(crash["id"]): Circle(
          circleId: CircleId(
            crash["id"],
          ),
          fillColor: Colors.red.withOpacity(0.5),
          center: ll,
          radius: 25,
          strokeWidth: 0,
          zIndex: 100,
        ),
      });
    });
  }

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
        Positioned(
          right: 8,
          bottom: 100,
          child: FloatingActionButton(
            mini: true,
            child: Icon(
              getController.isCameraLock
                  ? Icons.my_location_rounded
                  : Icons.location_disabled,
            ),
            onPressed: () {
              getController.isCameraLock = !getController.isCameraLock;
            },
          ),
        )
      ],
    );
  }

  @override
  isBuilded() {}
}
