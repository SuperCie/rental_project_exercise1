import 'package:balirental_project1/components/mysliverappbar.dart';
import 'package:balirental_project1/components/mytabbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) =>
                  [Mysliverappbar()],
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [Mytabbar()],
            ),
          )),
    );
  }
}
