import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/vehiclecarttile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) {
        //panggil user cart nya
        final userCart = context.watch<Catalog>();

        // Pastikan cart tidak kosong
        if (userCart.cart.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: Text('Cart')),
            body: Center(child: Text('Your cart is empty!')),
          );
        }
        //UI
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: Text(
              'Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.indigo.shade200,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.cart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart.cart[index];
                    return Vehiclecarttile(cartItem: cartItem);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
