import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference root = db.collection("service");

// ignore: non_constant_identifier_names
ListenServiceFireStore() {
  var obj = {'createdOn': FieldValue.serverTimestamp()};
  root.add(obj);
}
