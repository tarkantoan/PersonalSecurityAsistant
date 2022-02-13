import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/model/carcrash.model.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/settings/carcrash.settings.view.dart';

class CarCrashSettingsController extends SFWController {
  CarCrashSettingsController() : super();

  @override
  init() {
    realtimeTracker = General.prefs!.getBool("realtimeTracker") ?? false;
  }

  CarCrashSettings get getView => view as CarCrashSettings;

  static bool realtimeTracker = false;
  static StreamSubscription<LocationData>? streamSub;
  List<String> alermedLocs = [];

  static Future<bool> getDriveMode() async {
    final driveMode = General.prefs!.getBool("driveMode");
    if (driveMode ?? false) {
      General.prefs!.setBool("driveMode", false);
      return false;
    }
    return true;
  }

  static bool getRealtimeTracker() {
    final driveMode = General.prefs!.getBool("realtimeTracker");
    if (driveMode == null) {
      General.prefs!.setBool("realtimeTracker", false);
      return false;
    }
    return driveMode;
  }

  static changeNotificationSettings(Location location,
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

  static setTracker() async {
    if (getRealtimeTracker()) {
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
      streamSub =
          location.onLocationChanged.listen((LocationData currentLocation) {
        List<dynamic> list =
            (json.decode(CarCrashModel.demoData)['crashes']) as List<dynamic>;
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
                looping: true,
                volume: 1,
                asAlarm: true,
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
  }
}
