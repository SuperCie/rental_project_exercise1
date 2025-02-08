import 'package:balirental_project1/pages/history_page.dart';
import 'package:balirental_project1/pages/home_page.dart';
import 'package:balirental_project1/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Pagecontrol extends StatefulWidget {
  const Pagecontrol({super.key});

  @override
  State<Pagecontrol> createState() => _PagecontrolState();
}

class _PagecontrolState extends State<Pagecontrol> {
  // untuk perpindahan page
  int currentPageIndex = 0;

  final List pageOptionIndex = [
    HomePage(),
    OrderHistory(),
    ProfilePage(),
  ];

  void _onTappedIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOptionIndex[currentPageIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: GNav(
              curve: Curves.fastOutSlowIn,
              rippleColor: Theme.of(context).colorScheme.surface,
              haptic: true,
              tabBackgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.transparent,
              iconSize: 25,
              padding: EdgeInsets.all(20),
              onTabChange: _onTappedIndex,
              gap: 10,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.library_books_outlined,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
