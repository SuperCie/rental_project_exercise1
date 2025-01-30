import 'package:flutter/material.dart';

class Biketile extends StatelessWidget {
  const Biketile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 225,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          // // image
          Image.asset('assets/image/zx25r.jpg', fit: BoxFit.contain),
          SizedBox(
            height: 10,
          ),
          // // name
          Text(
            'Kawasaki ZX-25R',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          // // price
          Text('Rp 750.000 / Day'),
        ],
      ),
    );
  }
}
