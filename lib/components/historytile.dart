import 'package:balirental_project1/components/data/cartitem.dart';
import 'package:balirental_project1/components/data/catalog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Historytile extends StatelessWidget {
  final Cartitem cartItem;
  const Historytile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) => SafeArea(
          child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.transportation.imagePath,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.transportation.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '${DateFormat('dd MMM yyyy').format(cartItem.startDate)} - ${DateFormat('dd MMM yyyy').format(cartItem.endDate)}'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${cartItem.totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
