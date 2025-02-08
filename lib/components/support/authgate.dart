import 'package:balirental_project1/pages/loginorregist.dart';
import 'package:balirental_project1/pages/pagecontrol.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Pagecontrol();
        } else {
          return Loginorregist();
        }
      },
    );
  }
}
