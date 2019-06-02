class Spot {
  final String name;
  final String description;
  final double rating;

  Spot({String name, String description, double rating})
      : this.name = name ?? '',
        this.description = description ?? '',
        this.rating = rating ?? 0;
}
