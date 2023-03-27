import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future anonymousSignIn() async {
    try {
      // AuthResult => UserCredential
      UserCredential result = await _auth.signInAnonymously();
      // FirebaseUser => User
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
