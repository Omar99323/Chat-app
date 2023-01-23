import 'package:flutter/material.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/message.dart';

// ignore: must_be_immutable
class Bubble extends StatelessWidget {
  Bubble({Key? key, required this.msg}) : super(key: key);
  Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        decoration: const BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Text(
          msg.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Bubble2 extends StatelessWidget {
  Bubble2({Key? key, required this.msg}) : super(key: key);
  Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 9, 130, 146),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Text(
          msg.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
