import 'package:flutter/material.dart';
import 'package:scholar_chat/consts.dart';

// ignore: must_be_immutable
class ChatField extends StatelessWidget {
  ChatField({required this.txtcontroller ,
    required this.ons,
    Key? key,
  }) : super(key: key);
  Function(String) ons;
  TextEditingController txtcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: txtcontroller,
        onSubmitted: ons,
        decoration: InputDecoration(
          hintText: 'Send message',
          suffixIcon: GestureDetector(
            child: const Icon(
              Icons.send,
              color: primarycolor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: primarycolor,
            ),
          ),
        ),
      ),
    );
  }
}
