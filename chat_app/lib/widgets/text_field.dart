import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  Textfield({Key? key, required this.obscure , required this.pad, this.hint, required this.onchanged})
      : super(key: key);
  String? hint;
  double pad;
  Function(String) onchanged;
  bool obscure =false ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: pad),
      child: TextFormField(
        obscureText: obscure,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Fill the field';
          }
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: onchanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
