import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/user.dart';
import '../models/data_model.dart';

class DatabaseService {
  /// Collection Reference

  final String? uid;
  DatabaseService({this.uid});
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

  // Get user doc Stream
  Stream<UserData?> get userSnap {
    return dataCollection.doc(uid).snapshots().map(_userdataFromSnapshots);
  }

  UserData? _userdataFromSnapshots(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    return UserData(
      uid: data['uid'],
      name: data['name'],
      sugars: data['sugars'],
      strength: data['strength'],
    );
  }
}
