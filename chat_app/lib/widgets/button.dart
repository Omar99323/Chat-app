import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({Key? key, required this.txt , this.ontap}) : super(key: key);
  String txt;
  VoidCallback? ontap ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              txt,
              style: const TextStyle(
                fontSize: 26,
                color: Color.fromARGB(255, 51, 128, 141),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
