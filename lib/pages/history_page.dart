import 'package:balirental_project1/components/data/order.dart';
import 'package:balirental_project1/components/historytile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderHistoryProvider>(
      builder: (context, value, child) {
        final orderHistory = value.orderHistory;

        return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor: Colors.indigo.shade200,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'Order History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: orderHistory.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image/dealcar.png',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'No History Yet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: orderHistory.length,
                    itemBuilder: (context, index) {
                      final cartItem = orderHistory[index];
                      return Historytile(cartItem: cartItem);
                    },
                  ));
      },
    );
  }
}
