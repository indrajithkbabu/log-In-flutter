import 'package:flutter/material.dart';
import 'package:loginn/login/loginOne.dart';
import 'package:loginn/login/loginSplash.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME ='UserLoggedIn';
void main() {
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: loginSplash(),
    );
  }

  
}