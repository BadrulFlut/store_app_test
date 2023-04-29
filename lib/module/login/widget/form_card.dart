import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

Card formCard(TextEditingController controller, String text) {
  return Card(
    shadowColor: Colors.black,
    elevation: 20,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    ),
  );
}
