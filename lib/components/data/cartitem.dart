import 'package:balirental_project1/components/data/transportation.dart';

class Cartitem {
  final Transportation transportation;
  int days;

  Cartitem({required this.transportation, this.days = 1});

  // total price
  double get totalPrice {
    return transportation.price * days;
  }
}
