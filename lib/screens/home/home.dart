import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home/user_list.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: '').userData,
      child: Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () async {
                await _auth.userSignOut();
              },
              icon: Icon(Icons.exit_to_app_rounded),
              tooltip: 'Logout',
            )
          ],
        ),
        body: ListUser(),
      ),
    );
  }
}
