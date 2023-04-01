import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  /// Collection Reference

  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('dataCollection');

  Future updateData(String sugars, String name, int strength) async {
    Map<String, dynamic> data = {
      'sugars': sugars,
      'name': name,
      'strength': strength,
    };
    return await dataCollection.doc(uid).set(data);
  }

  Stream<QuerySnapshot> get userData {
    return dataCollection.snapshots();
  }
}
