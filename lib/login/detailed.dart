// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detailed extends StatefulWidget {
  const Detailed({
    Key? key,
    required this.names,
    required this.img,
    required this.description,
  }) : super(key: key);

  final String names;
  final String img;
  final List description;

  @override
  State<Detailed> createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Image.asset(widget.img),
          ),
          Text(
            widget.names,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      widget.description[index],
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                           textAlign: TextAlign.left,
                    );
                  },
                  itemCount: widget.description.length,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
