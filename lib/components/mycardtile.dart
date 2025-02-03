import 'package:balirental_project1/components/data/transportation.dart';
import 'package:flutter/material.dart';

class Mycardtile extends StatelessWidget {
  void Function()? ontap;
  final Transportation transportation;
  Mycardtile({super.key, required this.transportation, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    transportation.imagePath,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                //name
                Text(
                  transportation.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                //price
                Text('\$${transportation.price}'),
              ],
            ),
          ),
          Divider(
            height: 5,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
