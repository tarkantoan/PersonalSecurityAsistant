import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'carcrash.map.view.dart';

class CarCrashMapController extends SFWController {
  CarCrashMapController() : super();

  CameraPosition cameraPosition = CameraPosition(
      bearing: 200, target: LatLng(41.335900, 36.253450), tilt: 0, zoom: 17);

  late GoogleMapController mapController;
  BitmapDescriptor? bitmapIcon;

  bool _isCameraLock = false;

  bool get isCameraLock => _isCameraLock;

  set isCameraLock(bool isCameraLock) {
    (view as CarCrashMap).module.getView.state.setState(() {
      _isCameraLock = isCameraLock;
    });
  }

  List<String> alermedLocs = [];
  @override
  init() async {
    bool geolocisEnable = await _determinePosition.call();
    if (geolocisEnable) {
      bool wait = false;
      Geolocator.getPositionStream().every((element) {
        CarCrashMap.circles.forEach((key, value) {
          final distance = Geolocator.distanceBetween(element.latitude,
              element.longitude, value.center.latitude, value.center.longitude);

          if (distance < 300) {
            if (!alermedLocs.contains(value.circleId.value) && !wait) {
              FlutterRingtonePlayer.play(
                android: AndroidSounds.alarm,
                ios: IosSounds.glass,
                looping: true, // Android only - API >= 28
                volume: 1, // Android only - API >= 28
                asAlarm: true, // Android only - all APIs
              );
              wait = true;
              alermedLocs.add(value.circleId.value);
              mapController.animateCamera(CameraUpdate.newLatLng(
                  LatLng(value.center.latitude, value.center.longitude)));
              Future.delayed(const Duration(seconds: 5)).then((s) => {
                    FlutterRingtonePlayer.stop(),
                    wait = false,
                  });
            }
          }
        });

        if (isCameraLock && !wait) {
          cameraPosition = CameraPosition(
              target: LatLng(element.latitude, element.longitude),
              bearing: cameraPosition.bearing,
              zoom: cameraPosition.zoom);
          mapController.animateCamera(CameraUpdate.newLatLng(
              LatLng(element.latitude, element.longitude)));

          if ((view as CarCrashMap).module.getView.selectedIndex != 0) {
            return false;
          }
        }
        return true;
      });
    }
  }

  Future<bool> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return true;
  }
}
