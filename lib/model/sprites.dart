// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Sprites copyWith({
    String? frontDefault,
    String? frontShiny,
    String? backDefault,
    String? backShiny,
    Other? other,
  }) {
    return Sprites(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      other: other ?? this.other,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frontDefault': frontDefault,
      'frontShiny': frontShiny,
      'backDefault': backDefault,
      'backShiny': backShiny,
      'other': other.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      frontDefault: map['frontDefault'] as String,
      frontShiny: map['frontShiny'] as String,
      backDefault: map['backDefault'] as String,
      backShiny: map['backShiny'] as String,
      other: Other.fromMap(map['other'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sprites.fromJson(String source) =>
      Sprites.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sprites(frontDefault: $frontDefault, frontShiny: $frontShiny, backDefault: $backDefault, backShiny: $backShiny, other: $other)';
  }

  @override
  bool operator ==(covariant Sprites o) {
    if (identical(this, o)) return true;

    return o.frontDefault == frontDefault &&
        o.frontShiny == frontShiny &&
        o.backDefault == backDefault &&
        o.backShiny == backShiny &&
        o.other == other;
  }

  @override
  int get hashCode {
    return frontDefault.hashCode ^
        frontShiny.hashCode ^
        backDefault.hashCode ^
        backShiny.hashCode ^
        other.hashCode;
  }
}

class Other {
  const Other({
    required this.officialArtwork,
  });

  final OfficialArtwork officialArtwork;

  Other copyWith({
    OfficialArtwork? officialArtwork,
  }) {
    return Other(
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'officialArtwork': officialArtwork.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      officialArtwork: OfficialArtwork.fromMap(
          map['officialArtwork'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) =>
      Other.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Other(officialArtwork: $officialArtwork)';

  @override
  bool operator ==(covariant Other other) {
    if (identical(this, other)) return true;

    return other.officialArtwork == officialArtwork;
  }

  @override
  int get hashCode => officialArtwork.hashCode;
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  OfficialArtwork copyWith({
    String? frontDefault,
    String? frontShiny,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frontDefault': frontDefault,
      'frontShiny': frontShiny,
    };
  }

  factory OfficialArtwork.fromMap(Map<String, dynamic> map) {
    return OfficialArtwork(
      frontDefault: map['frontDefault'] as String,
      frontShiny: map['frontShiny'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromJson(String source) =>
      OfficialArtwork.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OfficialArtwork(frontDefault: $frontDefault, frontShiny: $frontShiny)';

  @override
  bool operator ==(covariant OfficialArtwork other) {
    if (identical(this, other)) return true;

    return other.frontDefault == frontDefault && other.frontShiny == frontShiny;
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontShiny.hashCode;
}
