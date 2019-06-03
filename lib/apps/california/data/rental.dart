class Rental {
  final String name;
  final String description;
  final String service;
  final String image;
  final double price;
  final int age;

  Rental(
      {String name, String description, String service, String image, double price, int age})
      : this.name = name ?? '',
        this.description = description ?? '',
        this.service = service ?? '',
        this.image = image ?? '',
        this.price = price ?? 0,
        this.age = age ?? 0;
}
