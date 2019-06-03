enum Difficulty { Easy, Intermediate, Advanced, Nuts }

class Hike {
  final String name;
  final String description;
  final String image;
  final Difficulty difficulty;
  final double length;

  Hike({String name, String description, String image, Difficulty difficulty, double length})
      : this.name = name ?? '',
        this.description = description ?? '',
        this.image = image ?? '',
        this.difficulty = difficulty ?? Difficulty.Easy,
        this.length = length ?? 0;
}
