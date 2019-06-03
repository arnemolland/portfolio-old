class Gift {
  final String name;
  final String description;
  final String image;
  final double price;
  final double rating;

  Gift({String name, String description, String image, double price, double rating}) :
  this.name = name ?? '',
  this.description = description ?? '',
  this.image = image ?? '',
  this.price = price ?? 0,
  this.rating = rating ?? 0;
}
