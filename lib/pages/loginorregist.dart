import 'package:balirental_project1/pages/login_page.dart';
import 'package:balirental_project1/pages/register_page.dart';
import 'package:flutter/material.dart';

class Loginorregist extends StatefulWidget {
  const Loginorregist({super.key});

  @override
  State<Loginorregist> createState() => _LoginorregistState();
}

class _LoginorregistState extends State<Loginorregist> {
  bool showLoginPage = true;

  void swapPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: swapPage);
    } else {
      return RegisterPage(onTap: swapPage);
    }
  }
}
