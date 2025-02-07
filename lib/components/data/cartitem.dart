import 'package:balirental_project1/components/data/transportation.dart';

class Cartitem {
  final Transportation transportation;
  int days;
  final DateTime startDate;
  final DateTime endDate;

  Cartitem({
    required this.transportation,
    this.days = 1,
    required this.startDate,
    required this.endDate,
  });

  // total price
  double get totalPrice {
    return transportation.price * days;
  }
}
