import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/auth/register.dart';
import '../auth/sign_in.dart';

class Authentication extends StatefulWidget {
  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInState(toggleView: toggleView);
    } else {
      return RegisterState(toggleView: toggleView);
    }
  }
}
