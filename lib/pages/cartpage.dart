import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/components/myformfield.dart';
import 'package:balirental_project1/components/vehiclecarttile.dart';
import 'package:balirental_project1/pages/summaryorder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Catalog>(
      builder: (context, catalog, child) {
        TextEditingController deliveryAddress = TextEditingController();
        TextEditingController returnAddress = TextEditingController();
        TextEditingController helmController = TextEditingController(text: '0');
        TextEditingController noteController = TextEditingController();

        //formkey validation for textformfield
        final _formKey = GlobalKey<FormState>();

        //panggil user cart nya
        final userCart = context.watch<Catalog>();

        // Pastikan cart tidak kosong
        if (userCart.cart.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cart'),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Center(child: Text('Your cart is empty!')),
          );
        }
        //UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Item',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            catalog.clearCart();
                          },
                          icon: Icon(Icons.delete_sweep),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userCart.cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart.cart[index];
                      return Vehiclecarttile(cartItem: cartItem);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Divider(
                      height: 20,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Myformfield(
                          controller: deliveryAddress,
                          text: 'Delivery Address',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Delivery Address';
                            }
                            return null;
                          },
                        ),
                        Myformfield(
                          controller: returnAddress,
                          text: 'Return Address',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Return Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                width: 125,
                                height: 75,
                                child: Column(
                                  children: [
                                    Text(
                                      'Helm',
                                    ),
                                    TextField(
                                      controller: helmController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-2]')),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Max 2 helmets")
                            ],
                          ),
                        ),
                        Myformfield(
                          controller: noteController,
                          text: 'Optional Note',
                          validator: (value) {
                            return null;
                          },
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1.0)),
                          height: 120,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sub Total',
                                  ),
                                  Text(
                                    '\$${catalog.getTotalPrice().toStringAsFixed(0)}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discount (10%)',
                                  ),
                                  Text(
                                    '-\$${catalog.getDiscountAmount().toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '\$${catalog.getTotalAfterDiscount().toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Mybutton(
                      width: double.infinity,
                      text: 'Continue',
                      ontap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Save user input data
                          Provider.of<Catalog>(context, listen: false)
                              .updateUserInputData(
                            deliveryAddress.text,
                            returnAddress.text,
                            helmController.text,
                            noteController.text,
                          );
                          // Navigate to the Summary Order Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryorderPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Please fill all the address fields')));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
