import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:pokemon_catcher/model/pokemon.dart';
import 'package:pokemon_catcher/services/rest_api_service.dart';

abstract class PokemonRepository {
  Future<Either<Exception, Pokemon>> getPokemon();
}

class PokemonRepositoryImpl implements PokemonRepository {
  const PokemonRepositoryImpl(this._restApiService);

  final RestApiServiceAbstract _restApiService;

  @override
  Future<Either<Exception, Pokemon>> getPokemon() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final id = Random().nextInt(1008).toString();
      final pokemon = await _restApiService.getPockemon(id);
      return pokemon;
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
