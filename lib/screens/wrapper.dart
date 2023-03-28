import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:provider/provider.dart';
import '../screens/home/home.dart';
import '../screens/auth/authentication.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
