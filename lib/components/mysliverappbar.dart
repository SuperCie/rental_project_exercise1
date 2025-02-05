import 'package:balirental_project1/components/mycarousel.dart';
import 'package:flutter/material.dart';

class Mysliverappbar extends StatelessWidget {
  const Mysliverappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: 250,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Mycarousel(),
          ],
        ),
      ),
    );
  }
}
