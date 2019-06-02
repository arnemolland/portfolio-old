enum Difficulty { easy, intermediate, advanced, nuts }

class Hike {
  final String name;
  final String description;
  final Difficulty difficulty;

  Hike({
    String name,
    String description,
    Difficulty difficulty,
  })  : this.name = name ?? '',
        this.description = description ?? '',
        this.difficulty = difficulty ?? Difficulty.easy;
}
