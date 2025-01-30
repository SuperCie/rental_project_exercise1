class Transportation {
  final String name;
  final String imagePath;
  final double price;
  final transportationCategory category;

  Transportation(
      {required this.name,
      required this.imagePath,
      required this.price,
      required this.category});
}

enum transportationCategory {
  motorBike,
  Car,
}
