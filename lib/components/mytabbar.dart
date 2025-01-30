import 'package:flutter/material.dart';

class Mytabbar extends StatelessWidget {
  const Mytabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.motorcycle),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'MotorBike',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.directions_car),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Car',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
