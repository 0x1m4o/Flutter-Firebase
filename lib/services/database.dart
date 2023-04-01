import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/data_model.dart';

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

  /// Membuat Stream untuk snapshot userdata
  Stream<List<DataModel>?> get userData {
    return dataCollection.snapshots().map(_brewListSnapshot);
  }

  /// Membuat sebuah list dari hasil snapshot tersebut
  List<DataModel>? _brewListSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((documents) {
      return DataModel(
        name: documents['name'] ?? '',
        strength: documents['strength'] ?? '',
        sugars: documents['sugars'] ?? '',
      );
    }).toList();
  }
}
