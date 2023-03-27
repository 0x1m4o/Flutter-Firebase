import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignInState extends StatefulWidget {
  @override
  State<SignInState> createState() => _SignInStateState();
}

class _SignInStateState extends State<SignInState> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign In to Chanddut Coffee'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.anonymousSignIn();
                if (result == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Data Tidak Ada')));
                } else {
                  print(result);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data berhasil dikirim')));
                }
              },
              child: Text('Sign In Anonymously'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.brown[300])),
            )
          ],
        ),
      ),
    );
  }
}
