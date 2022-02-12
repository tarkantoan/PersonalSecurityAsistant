import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class UserModel implements Model {
  late String ID;

  @override
  DocumentReference<Object?>? reference;

  UserModel({
    required this.ID,
    this.reference,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    UserModel newRestaurant =
        UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    newRestaurant.reference = snapshot.reference;
    return newRestaurant;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(ID: map['ID'] ?? '');
  }

  @override
  Map<String, dynamic> toMap() {
    return {'ID': ID};
  }
}
