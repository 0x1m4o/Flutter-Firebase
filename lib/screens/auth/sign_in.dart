import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignInState extends StatefulWidget {
  @override
  State<SignInState> createState() => _SignInStateState();
}

class _SignInStateState extends State<SignInState> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign In to Chanddut Coffee'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'person@example.com',
                          labelText: 'Email',
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.brown)),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.brown)),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            print(email);
                            print(password);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 15),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.brown[300])),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () async {
                          dynamic result = await _auth.anonymousSignIn();
                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Data Tidak Ada')));
                          } else {
                            print(result.uid);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Data berhasil dikirim')));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1,
                                color: Colors.black38,
                                style: BorderStyle.solid)),
                        child: Text(
                          'Sign In as Guest',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ]),
    );
  }
}
