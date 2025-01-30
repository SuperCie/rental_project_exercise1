import 'package:flutter/material.dart';

class Stackimage extends StatelessWidget {
  Stackimage({super.key});

  List<String> stackImages = [
    'assets/image/stack1.jpg',
    'assets/image/stack2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: stackImages.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            child: Image.asset(
              stackImages[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
