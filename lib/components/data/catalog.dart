import 'package:balirental_project1/components/data/transportation.dart';
import 'package:flutter/material.dart';

class Catalog extends ChangeNotifier {
//list menu
  final List<Transportation> _menu = [
    //bike
    Transportation(
        name: 'Kawasaki ZX-25R',
        imagePath: 'assets/image/bike/zx25r.jpg',
        price: 750,
        category: transportationCategory.superBike),
    Transportation(
        name: 'Kawasaki Z900',
        imagePath: 'assets/image/bike/z900.jpeg',
        price: 2500,
        category: transportationCategory.superBike),
    Transportation(
        name: 'XSR 155',
        imagePath: 'assets/image/bike/xsr155.png',
        price: 200,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'X-MAX',
        imagePath: 'assets/image/bike/xmax.png',
        price: 250,
        category: transportationCategory.superBike),
    Transportation(
        name: 'Vario 160',
        imagePath: 'assets/image/bike/vario160.jpeg',
        price: 110,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Vario 125',
        imagePath: 'assets/image/bike/vario125.jpeg',
        price: 90,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New N-Max Turbo',
        imagePath: 'assets/image/bike/nmaxturbo.png',
        price: 150,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New N-Max',
        imagePath: 'assets/image/bike/nmax.png',
        price: 125,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'MT-25',
        imagePath: 'assets/image/bike/mt25.png',
        price: 225,
        category: transportationCategory.superBike),
    Transportation(
        name: 'Mio GT',
        imagePath: 'assets/image/bike/miogt.jpeg',
        price: 75,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Beat',
        imagePath: 'assets/image/bike/hondabeat.jpeg',
        price: 90,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New BeatStreet',
        imagePath: 'assets/image/bike/beatstreet.jpeg',
        price: 100,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Filano',
        imagePath: 'assets/image/bike/filanopink.png',
        price: 105,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'CBR1000R SP',
        imagePath: 'assets/image/bike/cbr1000r.jpeg',
        price: 3000,
        category: transportationCategory.superBike),
    Transportation(
        name: 'CBR250RR',
        imagePath: 'assets/image/bike/cbr250rr.jpeg',
        price: 250,
        category: transportationCategory.superBike),
    Transportation(
        name: 'New Aerox',
        imagePath: 'assets/image/bike/aerox.png',
        price: 150,
        category: transportationCategory.motorBike),

    // car
    Transportation(
        name: 'Alphard',
        imagePath: 'assets/image/car/alphard.jpeg',
        price: 3700,
        category: transportationCategory.sportCar),
    Transportation(
        name: 'BMW M2',
        imagePath: 'assets/image/car/bmw.jpeg',
        price: 4500,
        category: transportationCategory.sportCar),
    Transportation(
        name: 'Brio',
        imagePath: 'assets/image/car/brio.jpeg',
        price: 350,
        category: transportationCategory.car),
    Transportation(
        name: 'Fortuner',
        imagePath: 'assets/image/car/fortuner.jpeg',
        price: 950,
        category: transportationCategory.car),
    Transportation(
        name: 'Innova Reborn',
        imagePath: 'assets/image/car/innova.jpeg',
        price: 500,
        category: transportationCategory.car),
    Transportation(
        name: 'Jazz',
        imagePath: 'assets/image/car/jazz.jpeg',
        price: 325,
        category: transportationCategory.car),
    Transportation(
        name: 'Mustang',
        imagePath: 'assets/image/car/mustang.jpeg',
        price: 4000,
        category: transportationCategory.sportCar),
    Transportation(
        name: 'Pajero',
        imagePath: 'assets/image/car/pajero.jpeg',
        price: 950,
        category: transportationCategory.car),
    Transportation(
        name: 'Raize',
        imagePath: 'assets/image/car/raize.jpeg',
        price: 400,
        category: transportationCategory.car),
    Transportation(
        name: 'Innova Zenix',
        imagePath: 'assets/image/car/zenix.jpeg',
        price: 800,
        category: transportationCategory.car),
  ];

  // getters
  List<Transportation> get menu => _menu;
}
