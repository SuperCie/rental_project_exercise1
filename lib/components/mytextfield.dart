import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final TextInputType? keyboardType;
  final String text;
  bool obscureText;
  Widget? iconWidget;
  Mytextfield(
      {super.key,
      required this.controller,
      required this.text,
      required this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: text,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
