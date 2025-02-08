import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  void Function()? ontap;
  final double width;
  Mybutton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(12),
        width: width,
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
