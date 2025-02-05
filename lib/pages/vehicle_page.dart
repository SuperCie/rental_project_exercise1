import 'package:balirental_project1/components/data/transportation.dart';
import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/pages/booktime_page.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  final Transportation transportation;
  const VehiclePage({super.key, required this.transportation});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI
        Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // upper
                    Column(
                      children: [
                        Image.asset(
                          widget.transportation.imagePath,
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.transportation.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.transportation.description,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${widget.transportation.price.toStringAsFixed(0)} /Day',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // button
                    Column(
                      children: [
                        Divider(
                          height: 15,
                        ),
                        Mybutton(
                          text: 'Book Now',
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BooktimePage(
                                    transportation: widget.transportation,
                                  ),
                                ));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_rounded,
              ),
            ),
          )),
        )
      ],
    );
  }
}
