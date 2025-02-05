import 'package:balirental_project1/components/data/cartitem.dart';
import 'package:balirental_project1/components/data/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Vehiclecarttile extends StatelessWidget {
  final Cartitem cartItem;
  const Vehiclecarttile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1.0)),
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItem.transportation.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$${cartItem.transportation.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${cartItem.days} Days'),
                  IconButton(
                      onPressed: catalog.dispose,
                      icon: Icon(Icons.delete_forever))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
