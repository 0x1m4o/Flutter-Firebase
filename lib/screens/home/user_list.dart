import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    final userDocs = Provider.of<QuerySnapshot>(context);
    for (var doc in userDocs.docs) {
      print(doc.data());
    }
    return Container();
  }
}
