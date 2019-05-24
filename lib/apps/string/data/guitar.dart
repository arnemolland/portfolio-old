class Guitar {
  final String brand;
  final String model;
  final String image;

  Guitar({String brand, String model, String image})
      : this.brand = brand ?? 'Fender',
        this.model = model ?? 'Telecaster Deluxe Rosewood',
        this.image = image ?? 'images/guitars/telecaster.png';
}
