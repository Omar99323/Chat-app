import 'package:flutter/material.dart';

const primarycolor = Color.fromARGB(255, 20, 43, 77);

void snakbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

const logo = 'assets/images/scholar.png';
