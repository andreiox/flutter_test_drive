import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Icon? icon;

  const Input(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hint,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration:
            InputDecoration(labelText: label, hintText: hint, icon: icon),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
