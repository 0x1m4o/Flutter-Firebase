import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class RegisterState extends StatefulWidget {
  @override
  State<RegisterState> createState() => _RegisterStateState();
}

class _RegisterStateState extends State<RegisterState> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Register to Chanddut Coffee'),
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
                      onChanged: (value) {},
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
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {},
                          child: Text(
                            'Register',
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
