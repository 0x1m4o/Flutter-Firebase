import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
