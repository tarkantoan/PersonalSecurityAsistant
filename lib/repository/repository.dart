import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class Repository {
  late final CollectionReference collection;

  Future<DocumentReference> add(Model model) {
    return collection.add(model.toMap());
  }

  Future<bool> update(Model model) async {
    await collection.doc(model.reference?.id).set(model.toMap());
    return true;
  }

  Future<bool> delete(Model model) async {
    await collection.doc(model.reference?.id).delete();
    return true;
  }

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
}
