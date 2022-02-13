import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'carcrash.settings.controller.dart';

class CarCrashSettings extends SFW {
  CarCrashSettings({Key? key, required controller})
      : super(key: key, controller: controller) {}

  CarCrashSettingsController get getController =>
      controller as CarCrashSettingsController;

  @override
  initState() {}

  @override
  Widget build() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              FlutterRingtonePlayer.stop();
            },
            child: Text("alarm")),
        Switch(
            value: CarCrashSettingsController.getRealtimeTracker(),
            onChanged: (sss) async {
              General.prefs!
                  .setBool("realtimeTracker",
                      !CarCrashSettingsController.getRealtimeTracker())
                  .then((value) => {
                        state.setState(() {
                          CarCrashSettingsController.realtimeTracker =
                              !CarCrashSettingsController.getRealtimeTracker();
                        }),
                        CarCrashSettingsController.setTracker(),
                      });
            }),
      ],
    );
  }

  @override
  isBuilded() {}
}
