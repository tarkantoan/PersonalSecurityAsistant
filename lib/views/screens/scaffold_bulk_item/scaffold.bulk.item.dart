import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

SpeedDial speedDial = SpeedDial(
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
      onTap: () => print('FIRST CHILD'),
      onLongPress: () => print('FIRST CHILD LONG PRESS'),
    ),
    SpeedDialChild(
      child: Icon(Icons.brush),
      backgroundColor: Colors.blue,
      label: 'Second',
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => print('SECOND CHILD'),
      onLongPress: () => print('SECOND CHILD LONG PRESS'),
    ),
    SpeedDialChild(
      child: Icon(Icons.keyboard_voice),
      backgroundColor: Colors.green,
      label: 'Sürüş Modu',
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => print('THIRD CHILD'),
      onLongPress: () => print('THIRD CHILD LONG PRESS'),
    ),
  ],
);
