import 'package:flutter/material.dart';

class Categorybar extends StatelessWidget {
  const Categorybar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 150,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Icon(Icons.motorcycle),
                SizedBox(
                  width: 4,
                ),
                Text('Motorbike',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200),
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.car_rental),
                SizedBox(
                  width: 4,
                ),
                Text('Car',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
