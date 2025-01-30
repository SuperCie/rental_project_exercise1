import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  void Function()? ontap;
  Mybutton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(12),
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
