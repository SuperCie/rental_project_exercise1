import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Mycarousel extends StatefulWidget {
  const Mycarousel({super.key});

  @override
  State<Mycarousel> createState() => _MycarouselState();
}

class _MycarouselState extends State<Mycarousel> {
  final List<String> imageCarousel = [
    'assets/image/stack1.jpg',
    'assets/image/stack2.jpg',
    'assets/image/stack3.jpeg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imageCarousel.map(
            (imagePath) {
              return Builder(
                builder: (context) => Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            height: 350,
            aspectRatio: 16 / 9,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 1.0, // untuk menunjukkan gambar full 1 layar
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 20,
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: imageCarousel.length,
            effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.yellowAccent,
                dotColor: Colors.grey),
          ),
        )
      ],
    );
  }
}
