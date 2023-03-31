import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  /// Collection Reference
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('dataCollection');
}
