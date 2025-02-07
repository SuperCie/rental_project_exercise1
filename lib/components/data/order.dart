import 'package:balirental_project1/components/data/cartitem.dart';
import 'package:flutter/material.dart';

class OrderHistoryProvider extends ChangeNotifier {
  final List<Cartitem> _orderHistory = [];

  List<Cartitem> get orderHistory => _orderHistory;

  void addconfirmedOrder(Cartitem cartItem) {
    _orderHistory.add(cartItem);
    notifyListeners();
  }
}
