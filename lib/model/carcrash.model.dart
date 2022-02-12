import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model.dart';

enum CarCrashSender { User, Admin, Api }
enum CarCrashLevel { Light, Heavy, Critical }

class CarCrashModel implements Model {
  static String demoData =
      '{"crashes": [{"id":"3","latLng": [41.335175, 36.255038]},{"id": "4","latLng": [41.336484, 36.259325]},{"id": "5","latLng": [41.334405, 36.257615]}]}';

  String id;
  LatLng latLng = const LatLng(0, 0);

  CarCrashModel({
    this.id = "",
    this.latLng = const LatLng(0, 0),
  });

  CarCrashModel copyWith({
    String? id,
    LatLng? latLng,
  }) {
    return CarCrashModel(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'latLng': latLng};
  }

  factory CarCrashModel.fromMap(Map<String, dynamic> map) {
    return CarCrashModel(
      id: map['id'],
      latLng: map['latLng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarCrashModel.fromJson(String source) =>
      CarCrashModel.fromMap(json.decode(source));

  @override
  DocumentReference<Object?>? reference;
}
