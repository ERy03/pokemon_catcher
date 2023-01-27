// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  const PokemonInitial();
}

class PokemonLoading extends PokemonState {
  const PokemonLoading();
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded(this.pokemon);

  final Pokemon pokemon;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonLoaded && other.pokemon == pokemon;
  }

  @override
  int get hashCode => pokemon.hashCode;
}

class PokemonError extends PokemonState {
  const PokemonError(this.message);

  final String message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
