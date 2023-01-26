// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
