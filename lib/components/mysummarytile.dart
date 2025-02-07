import 'package:balirental_project1/components/data/cartitem.dart';
import 'package:balirental_project1/components/data/catalog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Mysummarytile extends StatelessWidget {
  final Cartitem cartItem;

  const Mysummarytile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) => SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${cartItem.days} x '),
                        Text(
                          cartItem.transportation.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '\$${cartItem.transportation.price.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat('dd MMM yyyy').add_Hm().format(cartItem.startDate)} - ${DateFormat('dd MMM yyyy').add_Hm().format(cartItem.endDate)}',
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
