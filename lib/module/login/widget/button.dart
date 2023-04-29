import 'package:flutter/material.dart';

ElevatedButton button(VoidCallback button, String text) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
    ),
    onPressed: button,
    child: Text(text),
  );
}
