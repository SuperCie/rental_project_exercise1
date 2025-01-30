import 'package:balirental_project1/pages/loginorregist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TropicGo());
}

class TropicGo extends StatelessWidget {
  const TropicGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginorregist(),
    );
  }
}
