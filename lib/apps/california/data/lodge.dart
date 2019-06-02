class Lodge {
  final String name;
  final String description;
  final String image;
  final double rating;

  Lodge({
    String name,
    String description,
    String image,
    double rating,
  })  : this.name = name ?? '',
        this.description = description ?? '',
        this.image = image ?? '',
        this.rating = rating ?? 0;
}
