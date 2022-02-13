import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/settings/carcrash.settings.controller.dart';

class SpeedDialWidget extends StatefulWidget {
  SpeedDialWidget({Key? key}) : super(key: key);
  bool realtimeTracker = false;

  @override
  _SpeedDialWidgetState createState() => _SpeedDialWidgetState();
}

class _SpeedDialWidgetState extends State<SpeedDialWidget> {
  @override
  void initState() {
    realtimeTracker();
    super.initState();
  }

  realtimeTracker() async {
    widget.realtimeTracker = await CarCrashSettingsController.getDriveMode();
    setState(() {
      print(widget.realtimeTracker);
      widget.realtimeTracker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.remove,
      buttonSize: Size(56, 56),
      visible: true,
      closeManually: true,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Personal Security Fast Process',
      heroTag: 'personal-security-fast-process',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.accessibility),
          backgroundColor: Colors.red,
          label: 'Acil Yardım',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => CallEmergency())),
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Icon(Icons.brush),
          backgroundColor: Colors.blue,
          label: 'Alarm Çal',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => () {},
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: widget.realtimeTracker
              ? Icon(Icons.keyboard_voice)
              : Icon(Icons.multiple_stop),
          backgroundColor: Colors.green,
          label: 'Sürüş Modu',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            General.prefs!
                .setBool("realtimeTracker",
                    !CarCrashSettingsController.getRealtimeTracker())
                .then((value) => {
                      setState(() {
                        widget.realtimeTracker =
                            CarCrashSettingsController.getRealtimeTracker();
                        CarCrashSettingsController.realtimeTracker =
                            !CarCrashSettingsController.getRealtimeTracker();
                        CarCrashSettingsController.setTracker();
                      }),
                    });
          },
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
      ],
    );
  }
}
