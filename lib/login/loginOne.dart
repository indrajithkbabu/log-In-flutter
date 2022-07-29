// ignore_for_file: camel_case_types, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:loginn/login/loginTwo.dart';
import 'package:loginn/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginOne extends StatefulWidget {
  @override
  State<loginOne> createState() => _loginOneState();
}

class _loginOneState extends State<loginOne> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  String? admin;
  String? passwd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 70, bottom: 10),
              child: Image.asset(
                'assets/flutter-login.png',
                width: 200,
                height: 200,
              )),
          const Text(
            'Flutter login',
            style: TextStyle(
                fontSize: 25,
                letterSpacing: 10,
                fontWeight: FontWeight.w400,
                fontFamily: "login font"),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shadowColor: Colors.blueAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            return null;
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

    if (_username == 'admin' && _password == 'passwd') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => loginTwo()));
    } else {
      //snackbar
      final _error = "Username and password doesnt match";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(_error)));
    }
  }
}
