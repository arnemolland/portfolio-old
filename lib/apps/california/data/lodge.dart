class Lodge {
  final String name;
  final String description;
  final String image;
  final double rating;
  final double price;

  Lodge({
    String name,
    String description,
    String image,
    double rating,
    double price,
  })  : this.name = name ?? '',
        this.description = description ?? '',
        this.image = image ?? '',
        this.rating = rating ?? 0,
        this.price = price ?? 0;
}
