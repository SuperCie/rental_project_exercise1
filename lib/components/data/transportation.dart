class Transportation {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final transportationCategory category;

  Transportation(
      {required this.name,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.description});
}

enum transportationCategory { bike, car }
