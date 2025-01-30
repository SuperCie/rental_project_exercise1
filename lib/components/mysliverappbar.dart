import 'package:balirental_project1/components/mycarousel.dart';
import 'package:flutter/material.dart';

class Mysliverappbar extends StatelessWidget {
  const Mysliverappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        expandedHeight: 350,
        floating: true,
        pinned: false,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: SizedBox(height: 300, child: Mycarousel()),
              ),
              // Search
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  height: 100,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // search bar
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              hintText: 'Search..',
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // cart icon
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
