import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginn/login/loginOne.dart';
import 'package:loginn/login/loginTwo.dart';
import 'package:loginn/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginSplash extends StatefulWidget {
  const loginSplash({Key? key}) : super(key: key);

  @override
  State<loginSplash> createState() => _loginSplashState();
}

class _loginSplashState extends State<loginSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/flutter-login.png', height: 150),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future goToLogin() async {
    await Future.delayed(Duration(seconds:3 ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return loginOne();
    }));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      goToLogin();
    } else {
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return loginTwo();
    }
   
    ));
  }
}
}