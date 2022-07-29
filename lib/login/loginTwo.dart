import 'package:flutter/material.dart';
import 'package:loginn/login/containedList.dart';
import 'package:loginn/login/loginOne.dart';
import 'package:loginn/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginTwo extends StatefulWidget {
  const loginTwo({Key? key}) : super(key: key);

  @override
  State<loginTwo> createState() => _loginTwoState();
}

class _loginTwoState extends State<loginTwo> {
  List<String> names = ['Dart' , 'IDE for development', 'User interface', 'Assets', 'Local storage','State management','Version control','Firebase'];

  List<String> img = [
    'assets/dart.jpg',
    'assets/vscode.png',
    'assets/userinterface.png',
    'assets/audio.png',
    'assets/storage.jpeg',
    'assets/state management.png',
    'assets/git.png',
    'assets/firebase.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Flutter-Road map',
        style: TextStyle(
          fontSize: 25
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_outlined),
            onPressed: () {
              // handle the press
              showAlertDialog(context);
              // logOut(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return ContainedList( img: img[index], names: names[index], number:index, );
            }),
            separatorBuilder: ((context, index) => Divider()),
            itemCount: 8),
      ),
      // body: ListView(
      //   children:[ Column(
      //     children: [

      //       Container(
      //          decoration: BoxDecoration(
      //           color: Colors.blueGrey,
      //         ),
      //         width: MediaQuery.of(context).size.width,
      //         height: 200,

      //       ),
      //        Container(
      //          decoration: BoxDecoration(
      //           color: Colors.green[200],
      //         ),
      //         width: MediaQuery.of(context).size.width,
      //         height: 200,

      //       ),

      //     ],
      //   ),]
      // ),
    );
  }

  logOut(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) => loginOne())),
        (route) => false);
  }

  showAlertDialog(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        logOut(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log-out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
