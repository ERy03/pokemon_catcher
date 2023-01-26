class Sprites {
  Sprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.backDefault,
    required this.backShiny,
    required this.other,
  });

  final String frontDefault;
  final String frontShiny;
  final String backDefault;
  final String backShiny;
  final Other other;
}

class Other {
  const Other({
    required this.officialArtwork,
  });

  final OfficialArtwork officialArtwork;
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;
}
