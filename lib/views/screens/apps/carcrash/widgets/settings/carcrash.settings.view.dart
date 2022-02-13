import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'carcrash.settings.controller.dart';

class CarCrashSettings extends SFW {
  CarCrashSettings({Key? key, required controller})
      : super(key: key, controller: controller) {}

  CarCrashSettingsController get getController =>
      controller as CarCrashSettingsController;

  @override
  initState() {}
  String text = "asd";
  ss() async {}

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
            value: getController.realtimeTracker,
            onChanged: (sss) async {
              state.setState(() {
                getController.realtimeTracker = !getController.realtimeTracker;
                getController.setTracker();
              });
            }),
      ],
    );
  }

  @override
  isBuilded() {}
}
