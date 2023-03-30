import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/auth/sign_in.dart';
import 'package:flutter_firebase/screens/home/home.dart';
import 'package:flutter_firebase/services/auth.dart';

class RegisterState extends StatefulWidget {
  final Function? toggleView;
  RegisterState({this.toggleView});
  @override
  State<RegisterState> createState() => _RegisterStateState();
}

class _RegisterStateState extends State<RegisterState> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleView!();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.person),
              label: Text('Sign In'))
        ],
      ),
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 0, 0),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[600]),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an Email' : null,
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
                              floatingLabelStyle:
                                  TextStyle(color: Colors.brown)),
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
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an Password' : null,
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
                              floatingLabelStyle:
                                  TextStyle(color: Colors.brown)),
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
                                if (_formKey.currentState!.validate()) {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'lol';
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 15),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.brown[300])),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          error,
                          style: TextStyle(fontSize: 15),
                        ),
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
