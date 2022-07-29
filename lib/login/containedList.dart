import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginn/login/detailed.dart';
import 'package:loginn/login/loginTwo.dart';

class ContainedList extends StatefulWidget {
  const ContainedList(
      {Key? key, required this.img, required this.names, required this.number})
      : super(key: key);

  final int number;
  final String names;
  final String img;

  @override
  State<ContainedList> createState() => _ContainedListState();
}

class _ContainedListState extends State<ContainedList> {
  List<List<String>> descr1 = [
    ['intro', 'syntax', 'data types', 'Null safety', 'function', 'oops'],
    ['VS code', 'Android Studio'],
    ['Widget', 'Statefull', 'Stateless', 'Button', 'list'],
    ['Audio', 'Video', 'Fonts', 'Images'],
    ['Shared preference', 'Sqlite', 'File storage'],
    ['setState', 'Provider', 'Blox', 'Redux'],
    ['Git', 'Github', 'Bitbucket', 'Gitlab'],
    [
      'Firebase auth',
      'Firebase database',
      'Firebase storage',
      'Firebase messaging'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .27,
      child: Center(
          child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => Detailed(
                      img: widget.img,
                      names: widget.names,
                      description: descr1[widget.number],
                    ))),
            child: Image.asset(
              widget.img,
              fit: BoxFit.cover,
            ),
          ),
          //  SizedBox(height: 1,),
          Text(
            widget.names,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'login font'),
               
          ),
        ],
      )),
    );
  }
}
