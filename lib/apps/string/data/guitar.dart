import 'package:portfolio/apps/string/data/specs.dart';

class Guitar {
  final String brand;
  final String model;
  final String image;
  final Specs specs;

  Guitar({String brand, String model, String image, Specs specs})
      : this.brand = brand ?? 'Fender',
        this.model = model ?? 'Telecaster Deluxe Rosewood',
        this.image = image ?? 'images/guitars/telecaster.png',
        this.specs = specs ?? Specs();
}
