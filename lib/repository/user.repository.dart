import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_security_asistant/model/user.model.dart';
import 'package:personal_security_asistant/repository/repository.dart';

class UserRepository extends Repository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("users");

  Future<UserModel?> getFromId(String id) async {
    DocumentSnapshot<Object?> document = await collection.doc(id).get();
    UserModel model;
    if (document.exists) {
      model = UserModel.fromMap(document.data() as Map<String, dynamic>);
      model.reference = document.reference;
      return model;
    }
    return null;
  }

  getAll() async {}

  deleteFromId() async {}

  Future<UserModel?> checkLogin(String username, String password) async {
    // return UserModel.fromJson(response.body);

    return null;
  }
}
