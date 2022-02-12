import 'package:cloud_firestore/cloud_firestore.dart';
import 'repository.dart';

class RestaurantRepository extends Repository {
  @override
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("restaurants");

  getAllRestaurants() {}
}
