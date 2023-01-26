// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_catcher/model/sprites.dart';

class Pokemon {
  const Pokemon({
    required this.id,
    required this.name,
    required this.order,
    required this.height,
    required this.weight,
    required this.sprites,
  });

  final int id;
  final String name;
  final int order;
  final int height;
  final int weight;
  final Sprites sprites;

  Pokemon copyWith({
    int? id,
    String? name,
    int? order,
    int? height,
    int? weight,
    Sprites? sprites,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      sprites: sprites ?? this.sprites,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'order': order,
      'height': height,
      'weight': weight,
      'sprites': sprites.toMap(),
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] as int,
      name: map['name'] as String,
      order: map['order'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int,
      sprites: Sprites.fromMap(map['sprites'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, order: $order, height: $height, weight: $weight, sprites: $sprites)';
  }

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.order == order &&
        other.height == height &&
        other.weight == weight &&
        other.sprites == sprites;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        order.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        sprites.hashCode;
  }
}
