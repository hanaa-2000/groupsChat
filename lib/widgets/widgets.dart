import 'package:flutter/material.dart';

void nextScreen(context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}

void nextScreenReplacement(context, page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return page;
  }));
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: color,
    action: SnackBarAction(label: 'Ok',onPressed: (){},textColor: Colors.white),
  ));
}
