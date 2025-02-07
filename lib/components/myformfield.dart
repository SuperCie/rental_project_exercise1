import 'package:flutter/material.dart';

class Myformfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  const Myformfield(
      {super.key,
      required this.controller,
      required this.text,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: text,
        ),
        validator: validator,
      ),
    );
  }
}
