import 'package:balirental_project1/components/data/cartitem.dart';
import 'package:balirental_project1/components/data/transportation.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Catalog extends ChangeNotifier {
//list menu
  final List<Transportation> _menu = [
    //bike
    Transportation(
        name: 'Kawasaki ZX-25R',
        imagePath: 'assets/image/bike/zx25r.jpg',
        price: 750,
        description:
            'Kawasaki ZX-25R adalah motor sport 250cc dengan mesin 4-silinder, memberikan performa tinggi dan kontrol maksimal. Dilengkapi dengan suspensi depan USD, ABS, dan desain agresif, ZX-25R cocok untuk pengendara yang menginginkan kecepatan dan kestabilan, baik di jalan raya maupun trek balap.',
        category: transportationCategory.superBike),
    Transportation(
        name: 'Kawasaki Z900',
        imagePath: 'assets/image/bike/z900.jpeg',
        price: 2500,
        description:
            'Kawasaki Z900 adalah motor naked bike 900cc dengan mesin 4-silinder yang bertenaga. Dikenal dengan desain tajam dan agresif, Z900 menawarkan performa tinggi, kestabilan, dan kenyamanan untuk berkendara di jalan raya. Ideal untuk pengendara yang mencari motor sporty dengan kontrol yang responsif dan tampilan modern.',
        category: transportationCategory.superBike),
    Transportation(
        name: 'XSR 155',
        imagePath: 'assets/image/bike/xsr155.png',
        price: 200,
        description:
            'Yamaha XSR 155 adalah motor retro modern 155cc dengan desain klasik yang dipadukan teknologi canggih. Ditenagai mesin SOHC, XSR 155 menawarkan kenyamanan dan performa yang stabil, cocok untuk pengendara yang menginginkan gaya dan kepraktisan dalam satu paket.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'X-MAX',
        imagePath: 'assets/image/bike/xmax.png',
        price: 250,
        description:
            'Yamaha X-MAX adalah skuter maxi 250cc yang menawarkan kenyamanan dan performa tinggi. Dengan desain elegan dan fitur canggih seperti ABS, X-MAX cocok untuk perjalanan jarak jauh maupun perkotaan, memberikan pengalaman berkendara yang stabil dan penuh gaya',
        category: transportationCategory.superBike),
    Transportation(
        name: 'Vario 160',
        imagePath: 'assets/image/bike/vario160.jpeg',
        price: 110,
        description:
            'Honda Vario 160 adalah skuter 160cc yang sporty dengan desain modern dan compact. Ditenagai mesin efisien, Vario 160 menawarkan performa cepat dan nyaman, cocok untuk berkendara di perkotaan dengan fitur canggih seperti Smart Key dan suspensi yang stabil.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Vario 125',
        imagePath: 'assets/image/bike/vario125.jpeg',
        price: 90,
        description:
            'Honda Vario 125 adalah skuter matik 125cc yang stylish dan efisien. Dengan desain modern dan mesin handal, Vario 125 menawarkan kenyamanan berkendara di perkotaan dengan performa yang responsif dan hemat bahan bakar.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New N-Max Turbo',
        imagePath: 'assets/image/bike/nmaxturbo.png',
        price: 150,
        description:
            'Yamaha New NMAX Turbo adalah skuter maxi dengan mesin 155cc yang dilengkapi teknologi turbo untuk performa lebih tinggi. Desain elegan dan fitur canggih seperti keyless system, menjadikan NMAX Turbo pilihan ideal untuk perjalanan jarak jauh dan perkotaan',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New N-Max',
        imagePath: 'assets/image/bike/nmax.png',
        price: 125,
        description:
            'Yamaha New NMAX 155cc adalah skuter premium dengan desain modern dan fitur canggih. Dikenal dengan kenyamanan berkendara dan performa optimal, NMAX ideal untuk pengendara yang membutuhkan skuter dengan kecepatan dan efisiensi bahan bakar.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'MT-25',
        imagePath: 'assets/image/bike/mt25.png',
        price: 225,
        description:
            'Yamaha MT-25 adalah motor naked bike 250cc dengan desain agresif dan mesin bertenaga. Dikenal dengan handling yang tajam, MT-25 menawarkan pengalaman berkendara yang responsif dan nyaman di berbagai kondisi jalan.',
        category: transportationCategory.superBike),
    Transportation(
        name: 'Mio GT',
        imagePath: 'assets/image/bike/miogt.jpeg',
        price: 75,
        description:
            'Yamaha Mio GT adalah skuter 125cc dengan desain sporty dan kompak. Ditenagai mesin efisien, Mio GT cocok untuk perjalanan perkotaan, menawarkan kenyamanan dan kemudahan berkendara dengan konsumsi bahan bakar yang hemat.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Beat',
        imagePath: 'assets/image/bike/hondabeat.jpeg',
        price: 90,
        description:
            'Honda Beat adalah skuter 110cc yang compact dan praktis. Dengan desain minimalis dan mesin irit, Beat cocok untuk pengendara muda yang mencari motor untuk mobilitas sehari-hari dengan efisiensi tinggi dan tampilan stylish.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'New BeatStreet',
        imagePath: 'assets/image/bike/beatstreet.jpeg',
        price: 100,
        description:
            'Honda New Beatstreet adalah varian skuter 110cc dengan desain street style yang kekinian. Dengan performa mesin efisien dan handling yang ringan, Beatstreet cocok untuk pengendara yang mengutamakan gaya dan kenyamanan berkendara.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'Filano',
        imagePath: 'assets/image/bike/filanopink.png',
        price: 105,
        description:
            'Yamaha Filano adalah skuter elegan 125cc dengan desain retro modern. Ditenagai mesin efisien, Filano menawarkan kenyamanan dalam berkendara dengan fitur canggih seperti lampu LED dan panel digital, ideal untuk perjalanan perkotaan.',
        category: transportationCategory.motorBike),
    Transportation(
        name: 'CBR1000R SP',
        imagePath: 'assets/image/bike/cbr1000r.jpeg',
        price: 3000,
        description:
            'Honda CBR1000RR SP adalah motor sport 1000cc yang menawarkan performa luar biasa di trek dan jalan raya. Dikenal dengan teknologi canggih seperti sistem suspensi elektronik, CBR1000RR SP memberikan pengalaman balap yang optimal dan handling presisi.',
        category: transportationCategory.superBike),
    Transportation(
        name: 'CBR250RR',
        imagePath: 'assets/image/bike/cbr250rr.jpeg',
        price: 250,
        description:
            'onda CBR250RR adalah motor sport 250cc dengan mesin DOHC yang bertenaga. Dengan desain agresif dan fitur canggih, CBR250RR memberikan performa tinggi serta kontrol yang presisi, cocok untuk pengendara yang menginginkan sensasi berkendara di trek dan jalan raya.',
        category: transportationCategory.superBike),
    Transportation(
        name: 'New Aerox',
        imagePath: 'assets/image/bike/aerox.png',
        price: 150,
        description:
            'Yamaha New Aerox adalah skuter sporty 155cc dengan desain tajam dan performa tinggi. Dilengkapi dengan teknologi VVA dan fitur-fitur canggih, Aerox memberikan pengalaman berkendara yang nyaman dan cepat di jalan perkotaan.',
        category: transportationCategory.motorBike),

    // car
    Transportation(
        name: 'Alphard',
        imagePath: 'assets/image/car/alphard.jpeg',
        price: 3700,
        description:
            'Toyota Alphard adalah MPV premium yang menawarkan kenyamanan luar biasa dengan desain elegan dan ruang kabin yang luas. Dilengkapi dengan fitur canggih dan teknologi hiburan, Alphard memberikan pengalaman berkendara mewah bagi pengemudi dan penumpang.',
        category: transportationCategory.sportCar),
    Transportation(
        name: 'BMW M2',
        imagePath: 'assets/image/car/bmw.jpeg',
        price: 4500,
        description:
            'BMW M2 adalah mobil sport kompak dengan mesin bertenaga tinggi dan desain agresif. Menyediakan performa yang luar biasa, M2 dirancang untuk pengemudi yang menginginkan sensasi berkendara dinamis dengan kontrol presisi dan akselerasi cepat.',
        category: transportationCategory.sportCar),
    Transportation(
        name: 'Brio',
        imagePath: 'assets/image/car/brio.jpeg',
        price: 350,
        description:
            'Honda Brio adalah hatchback kompak yang ideal untuk penggunaan sehari-hari di perkotaan. Dengan desain ringkas dan mesin efisien, Brio menawarkan kemudahan parkir dan konsumsi bahan bakar yang irit tanpa mengorbankan kenyamanan.',
        category: transportationCategory.car),
    Transportation(
        name: 'Fortuner',
        imagePath: 'assets/image/car/fortuner.jpeg',
        price: 950,
        description:
            'Toyota Fortuner adalah SUV bertenaga dengan desain tangguh dan fitur off-road yang mumpuni. Dikenal karena kenyamanan dan daya tahan, Fortuner sangat cocok untuk perjalanan jauh atau medan berat, serta dilengkapi dengan teknologi canggih untuk kenyamanan maksimal.',
        category: transportationCategory.car),
    Transportation(
        name: 'Innova Reborn',
        imagePath: 'assets/image/car/innova.jpeg',
        price: 500,
        description:
            'Toyota Innova Reborn adalah MPV keluarga dengan desain modern dan ruang kabin yang luas. Ditenagai mesin efisien, Innova Reborn memberikan kenyamanan dalam perjalanan jauh dengan fitur hiburan dan keselamatan yang lengkap.',
        category: transportationCategory.car),
    Transportation(
        name: 'Jazz',
        imagePath: 'assets/image/car/jazz.jpeg',
        price: 325,
        description:
            'Honda Jazz adalah hatchback serbaguna dengan desain kompak dan ruang kabin yang fleksibel. Dikenal karena efisiensi bahan bakar dan kenyamanan berkendara, Jazz sangat cocok untuk penggunaan sehari-hari di kota dengan performa responsif.',
        category: transportationCategory.car),
    Transportation(
        name: 'Mustang',
        imagePath: 'assets/image/car/mustang.jpeg',
        price: 4000,
        description:
            'Ford Mustang adalah mobil sport ikonik dengan mesin bertenaga tinggi dan desain agresif. Memberikan sensasi berkendara luar biasa, Mustang cocok bagi penggemar kecepatan dan performa tinggi, menawarkan pengalaman berkendara yang tak terlupakan.',
        category: transportationCategory.sportCar),
    Transportation(
        name: 'Pajero',
        imagePath: 'assets/image/car/pajero.jpeg',
        price: 950,
        description:
            'Mitsubishi Pajero adalah SUV off-road dengan kemampuan jelajah medan berat yang luar biasa. Dengan desain kokoh dan fitur-fitur premium, Pajero adalah pilihan ideal untuk petualang yang mencari kenyamanan sekaligus performa di jalanan ekstrim.',
        category: transportationCategory.car),
    Transportation(
        name: 'Raize',
        imagePath: 'assets/image/car/raize.jpeg',
        price: 400,
        description:
            'Toyota Raize adalah SUV kompak dengan desain modern dan fungsionalitas tinggi. Ditenagai mesin efisien, Raize menawarkan kenyamanan berkendara perkotaan dengan fitur canggih dan tampilan yang sporty, cocok untuk gaya hidup aktif.',
        category: transportationCategory.car),
    Transportation(
        name: 'Innova Zenix',
        imagePath: 'assets/image/car/zenix.jpeg',
        price: 800,
        description:
            'Toyota Innova Zenix Tipe Q Modellista adalah MPV premium dengan desain stylish dan ruang kabin yang mewah. Dilengkapi dengan teknologi canggih dan fitur-fitur keamanan terkini, Zenix Tipe Q Modellista memberikan kenyamanan ekstra dalam perjalanan keluarga.',
        category: transportationCategory.car),
  ];

  // get menu
  List<Transportation> get menu => _menu;
  // get cart
  final List<Cartitem> _cart =
      []; // jadi _Cart ini lah yang kita gunakan sebagai usernya disetiap codingan bawah
  //get user cart
  List<Cartitem> get cart => _cart;
// add to cart function
  void addtoCart(Transportation transportation, int days) {
    Cartitem? cartItem = _cart.firstWhereOrNull(
      (item) {
        return item.transportation == transportation;
      },
    );
    //if item exists, inscrese the days
    if (cartItem != null) {
      cartItem.days += days;
    } else {
      _cart.add(Cartitem(transportation: transportation, days: days));
    }
    notifyListeners();
  }

// remove from cart function
  void removeFromCart(Cartitem cartItem) {
    int cartIndex = _cart.indexOf(cartItem); //biar ketemu nih yang mana itemnya
    if (cartIndex != -1) {
      //check kalau item itu ada di cart gak
      if (_cart[cartIndex].days > 1) {
        _cart[cartIndex].days--; // kalau ada kurangin hari rentalnya
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// get total price
  double getTotalPrice() {
    double total = 0.0;
    for (Cartitem cartItem in _cart) {
      total += cartItem.totalPrice;
    }
    return total;
  }

// get total item count
  int totalItemCount() {
    return _cart.length;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// format double value into money
}
