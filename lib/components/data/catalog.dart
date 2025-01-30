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
        name: 'Yamaha XSR 155',
        imagePath: 'assets/image/bike/xsr155.png',
        price: 200,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Yamaha X-MAX',
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
        name: 'New Yamaha N-Max Turbo',
        imagePath: 'assets/image/bike/nmaxturbo.png',
        price: 150,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New Yamaha N-Max',
        imagePath: 'assets/image/bike/nmax.png',
        price: 125,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Yamaha MT-25',
        imagePath: 'assets/image/bike/mt25.png',
        price: 225,
        category: transportationCategory.superBike),
    Transportation(
        name: 'Yamaha Mio GT',
        imagePath: 'assets/image/bike/miogt.jpeg',
        price: 75,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Honda Beat',
        imagePath: 'assets/image/bike/hondabeat.jpeg',
        price: 90,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New Honda Beat Streat',
        imagePath: 'assets/image/bike/beatstreet.jpeg',
        price: 100,
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Filano',
        imagePath: 'assets/image/bike',
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
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New Yamaha Aerox',
        imagePath: 'assets/image/bike/aerox.png',
        price: 150,
        category: transportationCategory.motorBike)

    // car
  ];
}
