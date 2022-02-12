import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/model/carcrash.model.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';

class CarCrashSettings extends SFW {
  CarCrashSettings({Key? key, required controller})
      : super(key: key, controller: controller) {
    realtimeTracker = General.prefs!.getBool("realtimeTracker") ?? false;
  }

  CarCrashController get getController => controller as CarCrashController;

  @override
  initState() {}
  bool realtimeTracker = false;
  String text = "asd";
  ss() async {}

  StreamSubscription<LocationData>? streamSub;

  changeNotificationSettings(Location location,
      {String? channelName,
      String? iconName,
      String? subtitle,
      String? description,
      String? title}) {
    location.changeNotificationOptions(
        channelName: channelName ?? "Personal Security Asistant",
        iconName: iconName ?? "@mipmap/ic_launcher",
        subtitle: subtitle ??
            "Yolculuğunuzu daha güvenli hale getirmek için, sistemimiz konumuzu işliyor.",
        description: description ?? "Kaza Önleme",
        color: Colors.red,
        title: title ?? "Personal Security Asistant");
  }

  @override
  Widget build() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              FlutterRingtonePlayer.stop();
            },
            child: Text("alarm")),
        Text(text),
        Switch(
            value: realtimeTracker,
            onChanged: (sss) async {
              state.setState(() {
                realtimeTracker = !realtimeTracker;
              });
              General.prefs!.setBool("realtimeTracker", realtimeTracker);

              // LocationManager().interval = 1;
              // LocationManager().distanceFilter = 0;
              // LocationManager().notificationTitle =
              //     'Personal Security Asistant';
              // LocationManager().notificationMsg =
              //     'Yolculuğunuzu daha güvenli hale getirmek için, sistemimiz konumuzu işliyor.';
              // LocationManager().notificationBigMsg =
              //     'Yolculuğunuzu daha güvenli hale getirmek için, sistemimiz konumuzu işliyor.';
              if (realtimeTracker) {
                Location location = new Location();

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }

                _locationData = await location.getLocation();

                List<String> alermedLocs = [];
                streamSub = location.onLocationChanged
                    .listen((LocationData currentLocation) {
                  List<dynamic> list =
                      (json.decode(CarCrashModel.demoData)['crashes'])
                          as List<dynamic>;
                  list.forEach((element) {
                    final crash = (element as Map<String, dynamic>);
                    final distance = Geolocator.distanceBetween(
                        currentLocation.latitude!,
                        currentLocation.longitude!,
                        (crash["latLng"] as List)[0],
                        (crash["latLng"] as List)[1]);

                    if (distance < 250) {
                      if (!alermedLocs.contains(crash["id"])) {
                        FlutterRingtonePlayer.play(
                          android: AndroidSounds.alarm,
                          ios: IosSounds.glass,
                          looping: true, // Android only - API >= 28
                          volume: 1, // Android only - API >= 28
                          asAlarm: true, // Android only - all APIs
                        );
                        changeNotificationSettings(location, title: "Dikkat !");

                        Future.delayed(Duration(seconds: 5)).then((value) {
                          FlutterRingtonePlayer.stop();
                          changeNotificationSettings(location);
                        });
                        alermedLocs.add(crash["id"]);
                      }
                    }
                  });
                });
                changeNotificationSettings(location);
                location.enableBackgroundMode(enable: true);
              } else {
                Location().enableBackgroundMode(enable: false);
                streamSub != null ? streamSub!.cancel() : "";
              }
            }),
      ],
    );
  }

  @override
  isBuilded() {}
}
