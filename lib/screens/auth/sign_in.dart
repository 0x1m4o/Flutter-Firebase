import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/text_fields_constant.dart';
import '../../shared/emailValidator.dart';
import '../../shared/loading.dart';

class SignInState extends StatefulWidget {
  final Function? toggleView;
  SignInState({this.toggleView});
  @override
  State<SignInState> createState() => _SignInStateState();
}

class _SignInStateState extends State<SignInState> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              
              title: Text(
                'Sign In',
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
                    label: Text('Sign Up'))
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
                        'Log In',
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
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'person@example.com',
                                  labelText: 'Email',
                                ),
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
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Enter your Password',
                                  labelText: 'Password',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                error,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Could not Sign In with those Credentials';
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.brown[300])),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'OR',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    dynamic result =
                                        await _auth.anonymousSignIn();
                                    if (result == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Data Tidak Ada')));
                                    } else {
                                      print(result.uid);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Data berhasil dikirim')));
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.black38,
                                          style: BorderStyle.solid)),
                                  child: Text(
                                    'Sign In as Guest',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
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
