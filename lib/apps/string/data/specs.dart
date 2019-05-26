class Specs {
  final String finish;
  final String neck;
  final String profile;
  final String pickups;
  final String fretboard;
  final String material;
  final String nut;
  final String scale;

  Specs(
      {String finish,
      String neck,
      String profile,
      String pickups,
      String fretboard,
      String material,
      String nut,
      String scale})
      : this.finish = finish ?? 'Lake Placid Blue',
        this.neck = neck ?? 'Maple with nitro lacquer',
        this.profile = profile ?? '60\'s C',
        this.pickups = pickups ?? '2 Pure Vintage 64 Gray Bottom Single Coils',
        this.fretboard = fretboard ?? 'Rosewood (Dalbergia Latifolia)',
        this.material = material ?? 'Alder',
        this.nut = nut ?? 'Bone',
        this.scale = scale ?? '648mm';
}
