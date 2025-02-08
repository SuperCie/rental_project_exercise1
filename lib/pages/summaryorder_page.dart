import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/components/mysummarytile.dart';
import 'package:balirental_project1/pages/pagecontrol.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryorderPage extends StatelessWidget {
  const SummaryorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) {
        //panggil user cart nya
        final userCart = context.watch<Catalog>();
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Order Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 20,
                        ),
                        Text(
                          'Delivery Address',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 16),
                        ),
                        Text(
                          catalog.deliveryAddress,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Return Address',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 16),
                        ),
                        Text(
                          catalog.returnAddress,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Helm',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 16),
                        ),
                        Text(
                          catalog.helm,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Note',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 16),
                        ),
                        Text(
                          catalog.note,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: userCart.cart.length,
                          itemBuilder: (context, index) {
                            final cartItem = userCart.cart[index];
                            return Mysummarytile(cartItem: cartItem);
                          },
                        ),
                        Divider(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub Total'),
                        Text(
                          '\$${catalog.getTotalPrice().toStringAsFixed(0)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount (10%)'),
                        Text(
                          '-\$${catalog.getDiscountAmount().toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$${catalog.getTotalAfterDiscount().toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mybutton(
                          text: 'Cancel',
                          ontap: () => Navigator.pop(context),
                          width: 130,
                        ),
                        Mybutton(
                            text: 'Book Now',
                            ontap: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Check Your Order',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Please make sure your order is correct, as it cannot be cancelled once confirmed',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.justify,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          // Correct usage of Provider with listen: false
                                          Provider.of<Catalog>(context,
                                                  listen: false)
                                              .confirmOrder(context);
                                          Navigator.pop(context);

                                          // Navigate to the Pagecontrol page
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Pagecontrol(),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      'Your order has been successfully placed.')));
                                        },
                                        child: Text('Confirm'),
                                      ),
                                    ],
                                  ),
                                ),
                            width: 130)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
